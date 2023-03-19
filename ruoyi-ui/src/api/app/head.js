import request from '@/utils/request'

// 查询公告列表
export function listHead(query) {
  return request({
    url: '/app/head/list',
    method: 'get',
    params: query
  })
}

// 查询公告详细
export function getHead(id) {
  return request({
    url: '/app/head/' + id,
    method: 'get'
  })
}

// 新增公告
export function addHead(data) {
  return request({
    url: '/app/head',
    method: 'post',
    data: data
  })
}

// 修改公告
export function updateHead(data) {
  return request({
    url: '/app/head',
    method: 'put',
    data: data
  })
}

// 删除公告
export function delHead(id) {
  return request({
    url: '/app/head/' + id,
    method: 'delete'
  })
}
