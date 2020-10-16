package com.atoz.screw.mapper;

import com.atoz.screw.entity.SysResources;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface SysResourcesMapper extends BaseMapper<SysResources> {
    List<SysResources> selResourceList(long userId);
}
