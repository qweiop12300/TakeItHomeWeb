-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('关注', '2000', '1', 'concern', 'app/concern/index', 1, 0, 'C', '0', '0', 'app:concern:list', '#', 'admin', sysdate(), '', null, '关注菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('关注查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'app:concern:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('关注新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'app:concern:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('关注修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'app:concern:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('关注删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'app:concern:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('关注导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'app:concern:export',       '#', 'admin', sysdate(), '', null, '');