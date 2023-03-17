-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('公告', '2000', '1', 'head', 'app/head/index', 1, 0, 'C', '0', '0', 'app:head:list', '#', 'admin', sysdate(), '', null, '公告菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('公告查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'app:head:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('公告新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'app:head:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('公告修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'app:head:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('公告删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'app:head:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('公告导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'app:head:export',       '#', 'admin', sysdate(), '', null, '');