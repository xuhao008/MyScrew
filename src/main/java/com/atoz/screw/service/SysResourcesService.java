package com.atoz.screw.service;

import com.atoz.screw.entity.SysResources;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-12 16:31
 */

public interface SysResourcesService extends IService<SysResources> {

    public List<SysResources> selResourceList(long userId);
}
