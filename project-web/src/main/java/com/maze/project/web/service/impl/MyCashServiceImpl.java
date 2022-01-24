package com.maze.project.web.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.common.enums.CashEnum;
import com.maze.project.web.dto.cash.CashChartDTO;
import com.maze.project.web.dto.cash.CashDTO;
import com.maze.project.web.dto.cash.CashPageDTO;
import com.maze.project.web.dto.cash.PieItemColor;
import com.maze.project.web.dto.common.BarValueDTO;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.entity.MyCash;
import com.maze.project.web.mapper.MyCashMapper;
import com.maze.project.web.service.MyCashService;
import com.maze.project.web.vo.cash.CashPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 现金表 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyCashServiceImpl extends ServiceImpl<MyCashMapper, MyCash> implements MyCashService {

    @Override
    public CashPageDTO getCashPage(CashPageVO cashPageVO){
        CashPageDTO cashPageDTO = new CashPageDTO();
        List<CashDTO> cashDTOList = new ArrayList<>();
        Page<MyCash> page = new Page<>(cashPageVO.getPage(), cashPageVO.getPageSize());
        IPage<MyCash> iPage = page(page, Wrappers.<MyCash>lambdaQuery().orderByDesc(MyCash::getAmount));
        if (CollectionUtil.isNotEmpty(iPage.getRecords())){
            cashDTOList = iPage.getRecords().stream().map(myCash -> {
                CashDTO cashDTO = new CashDTO();
                cashDTO.setBankName(myCash.getBankName());
                cashDTO.setAmount(CommonConstant.DECIMAL_FORMAT.format(myCash.getAmount()));
                cashDTO.setLatestTime(myCash.getUpdateTime());

                return cashDTO;
            }).collect(Collectors.toList());
        }
        cashPageDTO.setCurrentPage(cashPageVO.getPage());
        cashPageDTO.setTotalNum(iPage.getTotal());
        cashPageDTO.setCashList(cashDTOList);

        return cashPageDTO;
    }

    @Override
    public CashChartDTO getChart() {
        List<PieDTO> pieList = new ArrayList<>();
        List<String> bankNameList = new ArrayList<>();
        List<BarValueDTO> bankValueList = new ArrayList<>();
        List<MyCash> cashList = list();
        for (MyCash cash : cashList){
            PieItemColor pieItemColor = new PieItemColor();
            String color = CashEnum.CashPieColorEnum.getColor(cash.getBankName());
            pieItemColor.setColor(color);

            PieDTO pieDTO = new PieDTO();
            pieDTO.setName(cash.getBankName());
            pieDTO.setValue(cash.getAmount().doubleValue());
            pieDTO.setItemStyle(pieItemColor);
            pieList.add(pieDTO);

            BarValueDTO barValueDTO = new BarValueDTO();
            barValueDTO.setValue(cash.getAmount().doubleValue());
            barValueDTO.setColor(color);
            bankValueList.add(barValueDTO);

            bankNameList.add(cash.getBankName());
        }
        CashChartDTO chartDTO = new CashChartDTO();
        chartDTO.setPieList(pieList);
        chartDTO.setBankNameList(bankNameList);
        chartDTO.setBankValueList(bankValueList);

        return chartDTO;
    }

    @Override
    public boolean updateCash(String bankName, String changeMoney) {

        MyCash myCash = getOne(Wrappers.<MyCash>lambdaQuery().eq(MyCash::getBankName, bankName));
        if (null != myCash){
            BigDecimal change = new BigDecimal(changeMoney);
            BigDecimal result = myCash.getAmount().add(change);
            myCash.setAmount(result);
            myCash.setUpdateTime(LocalDateTime.now());
        }else {
            myCash = new MyCash();
            myCash.setBankName(bankName);
            myCash.setAmount(new BigDecimal(changeMoney));
            myCash.setCreateTime(LocalDateTime.now());
            myCash.setUpdateTime(LocalDateTime.now());
        }

        return saveOrUpdate(myCash);
    }

    @Override
    public List<String> getBanksName() {

        List<MyCash> myCashes = list(Wrappers.<MyCash>lambdaQuery().select(MyCash::getBankName).groupBy(MyCash::getBankName));
        List<String> bankNames = myCashes.stream().map(MyCash::getBankName).collect(Collectors.toList());
        return bankNames;
    }
}
