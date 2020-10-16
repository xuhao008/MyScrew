package com.atoz.screw.service.impl;

import com.atoz.screw.entity.SysRole;
import com.atoz.screw.mapper.SysRoleMapper;
import com.atoz.screw.service.SysRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-12 16:33
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Override
    public List<SysRole> selRoleList(Long id) {
        List<SysRole> sysRoles = sysRoleMapper.selRoleList(id);
        return sysRoles;
    }
}
