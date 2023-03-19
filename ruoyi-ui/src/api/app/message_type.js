import request from '@/utils/request'

// 查询信息类型列表
export function listMessage_type(query) {
  return request({
    url: '/app/message_type/list',
    method: 'get',
    params: query
  })
}

// 查询信息类型详细
export function getMessage_type(id) {
  return request({
    url: '/app/message_type/' + id,
    method: 'get'
  })
}

// 新增信息类型
export function addMessage_type(data) {
  return request({
    url: '/app/message_type',
    method: 'post',
    data: data
  })
}

// 修改信息类型
export function updateMessage_type(data) {
  return request({
    url: '/app/message_type',
    method: 'put',
    data: data
  })
}

// 删除信息类型
export function delMessage_type(id) {
  return request({
    url: '/app/message_type/' + id,
    method: 'delete'
  })
}
