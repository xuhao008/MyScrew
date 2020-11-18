package com.atoz.screw.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.atoz.screw.entity.SysResources;

import java.util.List;

public interface SysResourcesMapper extends BaseMapper<SysResources> {
    List<SysResources> selResourceList(long userId);
}
