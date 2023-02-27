-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('话题', '2000', '1', 'topic', 'app/topic/index', 1, 0, 'C', '0', '0', 'app:topic:list', '#', 'admin', sysdate(), '', null, '话题菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('话题查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'app:topic:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('话题新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'app:topic:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('话题修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'app:topic:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('话题删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'app:topic:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('话题导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'app:topic:export',       '#', 'admin', sysdate(), '', null, '');