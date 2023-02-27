-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('捐赠', '2000', '1', 'donation', 'app/donation/index', 1, 0, 'C', '0', '0', 'app:donation:list', '#', 'admin', sysdate(), '', null, '捐赠菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('捐赠查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'app:donation:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('捐赠新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'app:donation:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('捐赠修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'app:donation:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('捐赠删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'app:donation:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('捐赠导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'app:donation:export',       '#', 'admin', sysdate(), '', null, '');