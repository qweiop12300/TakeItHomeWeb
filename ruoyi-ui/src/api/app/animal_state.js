import request from '@/utils/request'

// 查询动物状态关联列表
export function listAnimal_state(query) {
  return request({
    url: '/app/animal_state/list',
    method: 'get',
    params: query
  })
}

// 查询动物状态关联详细
export function getAnimal_state(id) {
  return request({
    url: '/app/animal_state/' + id,
    method: 'get'
  })
}

// 新增动物状态关联
export function addAnimal_state(data) {
  return request({
    url: '/app/animal_state',
    method: 'post',
    data: data
  })
}

// 修改动物状态关联
export function updateAnimal_state(data) {
  return request({
    url: '/app/animal_state',
    method: 'put',
    data: data
  })
}

// 删除动物状态关联
export function delAnimal_state(id) {
  return request({
    url: '/app/animal_state/' + id,
    method: 'delete'
  })
}
