import request from '@/utils/request'

// 查询评论点赞列表
export function listComments_like(query) {
  return request({
    url: '/app/comments_like/list',
    method: 'get',
    params: query
  })
}

// 查询评论点赞详细
export function getComments_like(id) {
  return request({
    url: '/app/comments_like/' + id,
    method: 'get'
  })
}

// 新增评论点赞
export function addComments_like(data) {
  return request({
    url: '/app/comments_like',
    method: 'post',
    data: data
  })
}

// 修改评论点赞
export function updateComments_like(data) {
  return request({
    url: '/app/comments_like',
    method: 'put',
    data: data
  })
}

// 删除评论点赞
export function delComments_like(id) {
  return request({
    url: '/app/comments_like/' + id,
    method: 'delete'
  })
}
