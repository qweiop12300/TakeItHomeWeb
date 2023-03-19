import request from '@/utils/request'

// 查询捐赠列表
export function listDonation(query) {
  return request({
    url: '/app/donation/list',
    method: 'get',
    params: query
  })
}

// 查询捐赠详细
export function getDonation(id) {
  return request({
    url: '/app/donation/' + id,
    method: 'get'
  })
}

// 新增捐赠
export function addDonation(data) {
  return request({
    url: '/app/donation',
    method: 'post',
    data: data
  })
}

// 修改捐赠
export function updateDonation(data) {
  return request({
    url: '/app/donation',
    method: 'put',
    data: data
  })
}

// 删除捐赠
export function delDonation(id) {
  return request({
    url: '/app/donation/' + id,
    method: 'delete'
  })
}
