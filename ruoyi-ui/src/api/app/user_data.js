import request from '@/utils/request'

// 查询用户数据扩展列表
export function listUser_data(query) {
  return request({
    url: '/app/user_data/list',
    method: 'get',
    params: query
  })
}

// 查询用户数据扩展详细
export function getUser_data(uid) {
  return request({
    url: '/app/user_data/' + uid,
    method: 'get'
  })
}

// 新增用户数据扩展
export function addUser_data(data) {
  return request({
    url: '/app/user_data',
    method: 'post',
    data: data
  })
}

// 修改用户数据扩展
export function updateUser_data(data) {
  return request({
    url: '/app/user_data',
    method: 'put',
    data: data
  })
}

// 删除用户数据扩展
export function delUser_data(uid) {
  return request({
    url: '/app/user_data/' + uid,
    method: 'delete'
  })
}
