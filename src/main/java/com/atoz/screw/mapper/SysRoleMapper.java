package com.atoz.screw.mapper;

import com.atoz.screw.entity.SysRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysRoleMapper extends BaseMapper<SysRole> {

   public List<SysRole> selRoleList(Long userId);
}
