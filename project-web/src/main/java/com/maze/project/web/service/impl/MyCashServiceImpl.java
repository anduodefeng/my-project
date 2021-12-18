package com.maze.project.web.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.cash.CashDTO;
import com.maze.project.web.dto.cash.CashPageDTO;
import com.maze.project.web.entity.MyCash;
import com.maze.project.web.mapper.MyCashMapper;
import com.maze.project.web.service.MyCashService;
import com.maze.project.web.vo.cash.CashPageVO;
import org.springframework.stereotype.Service;

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
}
