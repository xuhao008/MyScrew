package com.atoz.screw.service.impl;

import com.atoz.screw.entity.SysResources;
import com.atoz.screw.mapper.SysResourcesMapper;
import com.atoz.screw.service.SysResourcesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-12 16:32
 */

@Service
public class SysResourcesServiceImpl extends ServiceImpl<SysResourcesMapper, SysResources> implements SysResourcesService {

    @Autowired
    private SysResourcesMapper sysResourcesMapper;

    @Override
    public List<SysResources> selResourceList(long userId) {
        List<SysResources> sysResources= sysResourcesMapper.selResourceList(userId);
        return null;
    }
}
