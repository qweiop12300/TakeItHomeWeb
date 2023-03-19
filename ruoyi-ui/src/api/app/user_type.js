import request from '@/utils/request'

// 查询用户类型列表
export function listUser_type(query) {
  return request({
    url: '/app/user_type/list',
    method: 'get',
    params: query
  })
}

// 查询用户类型详细
export function getUser_type(id) {
  return request({
    url: '/app/user_type/' + id,
    method: 'get'
  })
}

// 新增用户类型
export function addUser_type(data) {
  return request({
    url: '/app/user_type',
    method: 'post',
    data: data
  })
}

// 修改用户类型
export function updateUser_type(data) {
  return request({
    url: '/app/user_type',
    method: 'put',
    data: data
  })
}

// 删除用户类型
export function delUser_type(id) {
  return request({
    url: '/app/user_type/' + id,
    method: 'delete'
  })
}
