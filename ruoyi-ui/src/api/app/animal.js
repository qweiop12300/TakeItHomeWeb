import request from '@/utils/request'

// 查询动物信息列表
export function listAnimal(query) {
  return request({
    url: '/app/animal/list',
    method: 'get',
    params: query
  })
}

// 查询动物信息详细
export function getAnimal(id) {
  return request({
    url: '/app/animal/' + id,
    method: 'get'
  })
}

// 新增动物信息
export function addAnimal(data) {
  return request({
    url: '/app/animal',
    method: 'post',
    data: data
  })
}

// 修改动物信息
export function updateAnimal(data) {
  return request({
    url: '/app/animal',
    method: 'put',
    data: data
  })
}

// 删除动物信息
export function delAnimal(id) {
  return request({
    url: '/app/animal/' + id,
    method: 'delete'
  })
}
