-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户类型', '2000', '1', 'user_type', 'app/user_type/index', 1, 0, 'C', '0', '0', 'app:user_type:list', '#', 'admin', sysdate(), '', null, '用户类型菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户类型查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'app:user_type:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户类型新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'app:user_type:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户类型修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'app:user_type:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户类型删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'app:user_type:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户类型导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'app:user_type:export',       '#', 'admin', sysdate(), '', null, '');