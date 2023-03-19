import request from '@/utils/request'

// 查询动物状态信息列表
export function listAnimal_state_data(query) {
  return request({
    url: '/app/animal_state_data/list',
    method: 'get',
    params: query
  })
}

// 查询动物状态信息详细
export function getAnimal_state_data(id) {
  return request({
    url: '/app/animal_state_data/' + id,
    method: 'get'
  })
}

// 新增动物状态信息
export function addAnimal_state_data(data) {
  return request({
    url: '/app/animal_state_data',
    method: 'post',
    data: data
  })
}

// 修改动物状态信息
export function updateAnimal_state_data(data) {
  return request({
    url: '/app/animal_state_data',
    method: 'put',
    data: data
  })
}

// 删除动物状态信息
export function delAnimal_state_data(id) {
  return request({
    url: '/app/animal_state_data/' + id,
    method: 'delete'
  })
}
