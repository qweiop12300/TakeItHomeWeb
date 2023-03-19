import request from '@/utils/request'

// 查询关注列表
export function listConcern(query) {
  return request({
    url: '/app/concern/list',
    method: 'get',
    params: query
  })
}

// 查询关注详细
export function getConcern(id) {
  return request({
    url: '/app/concern/' + id,
    method: 'get'
  })
}

// 新增关注
export function addConcern(data) {
  return request({
    url: '/app/concern',
    method: 'post',
    data: data
  })
}

// 修改关注
export function updateConcern(data) {
  return request({
    url: '/app/concern',
    method: 'put',
    data: data
  })
}

// 删除关注
export function delConcern(id) {
  return request({
    url: '/app/concern/' + id,
    method: 'delete'
  })
}
