-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('点赞', '2000', '1', 'like', 'app/like/index', 1, 0, 'C', '0', '0', 'app:like:list', '#', 'admin', sysdate(), '', null, '点赞菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('点赞查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'app:like:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('点赞新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'app:like:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('点赞修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'app:like:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('点赞删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'app:like:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('点赞导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'app:like:export',       '#', 'admin', sysdate(), '', null, '');