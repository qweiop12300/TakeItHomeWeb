-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('收藏', '2000', '1', 'collection', 'app/collection/index', 1, 0, 'C', '0', '0', 'app:collection:list', '#', 'admin', sysdate(), '', null, '收藏菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('收藏查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'app:collection:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('收藏新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'app:collection:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('收藏修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'app:collection:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('收藏删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'app:collection:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('收藏导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'app:collection:export',       '#', 'admin', sysdate(), '', null, '');