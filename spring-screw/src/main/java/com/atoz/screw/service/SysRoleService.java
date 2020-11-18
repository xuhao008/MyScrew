package com.atoz.screw.service;

import com.atoz.screw.entity.SysRole;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface SysRoleService extends IService<SysRole> {
    List<SysRole> selRoleList(Long id);
}
