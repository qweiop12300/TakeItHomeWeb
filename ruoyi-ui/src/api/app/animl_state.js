import request from '@/utils/request'

// 查询动物状态关联管理列表
export function listAniml_state(query) {
  return request({
    url: '/app/animl_state/list',
    method: 'get',
    params: query
  })
}

// 查询动物状态关联管理详细
export function getAniml_state(aid) {
  return request({
    url: '/app/animl_state/' + aid,
    method: 'get'
  })
}

// 新增动物状态关联管理
export function addAniml_state(data) {
  return request({
    url: '/app/animl_state',
    method: 'post',
    data: data
  })
}

// 修改动物状态关联管理
export function updateAniml_state(data) {
  return request({
    url: '/app/animl_state',
    method: 'put',
    data: data
  })
}

// 删除动物状态关联管理
export function delAniml_state(aid) {
  return request({
    url: '/app/animl_state/' + aid,
    method: 'delete'
  })
}
