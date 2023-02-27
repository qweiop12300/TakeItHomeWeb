-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户数据扩展', '2000', '1', 'user_data', 'app/user_data/index', 1, 0, 'C', '0', '0', 'app:user_data:list', '#', 'admin', sysdate(), '', null, '用户数据扩展菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户数据扩展查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'app:user_data:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户数据扩展新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'app:user_data:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户数据扩展修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'app:user_data:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户数据扩展删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'app:user_data:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户数据扩展导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'app:user_data:export',       '#', 'admin', sysdate(), '', null, '');