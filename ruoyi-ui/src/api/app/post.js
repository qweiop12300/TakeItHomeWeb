import request from '@/utils/request'

// 查询动态列表
export function listPost(query) {
  return request({
    url: '/app/post/list',
    method: 'get',
    params: query
  })
}

// 查询动态详细
export function getPost(id) {
  return request({
    url: '/app/post/' + id,
    method: 'get'
  })
}

// 新增动态
export function addPost(data) {
  return request({
    url: '/app/post',
    method: 'post',
    data: data
  })
}

// 修改动态
export function updatePost(data) {
  return request({
    url: '/app/post',
    method: 'put',
    data: data
  })
}

// 删除动态
export function delPost(id) {
  return request({
    url: '/app/post/' + id,
    method: 'delete'
  })
}
