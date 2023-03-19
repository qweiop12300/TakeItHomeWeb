import request from '@/utils/request'

// 查询动态类型列表
export function listPost_type(query) {
  return request({
    url: '/app/post_type/list',
    method: 'get',
    params: query
  })
}

// 查询动态类型详细
export function getPost_type(id) {
  return request({
    url: '/app/post_type/' + id,
    method: 'get'
  })
}

// 新增动态类型
export function addPost_type(data) {
  return request({
    url: '/app/post_type',
    method: 'post',
    data: data
  })
}

// 修改动态类型
export function updatePost_type(data) {
  return request({
    url: '/app/post_type',
    method: 'put',
    data: data
  })
}

// 删除动态类型
export function delPost_type(id) {
  return request({
    url: '/app/post_type/' + id,
    method: 'delete'
  })
}
