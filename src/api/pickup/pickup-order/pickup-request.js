import axios from '@axios'

export const GET_PICKUP_ORDER = params => axios.get(`/pickup/get/pickup-request?${params}`)

export const GET_PICKUP_ORDER_BY_ID = id => axios.get(`/pickup/get/pickup-request/${id}`)

export const ADD_PICKUP_ORDER = data => axios.post('/pickup/create/pickup-request/', data)

export const UPDATE_PICKUP_ORDER = data => axios.put(`/pickup/update/pickup-request/${data.no_pickup_order}`, data)

export const DELETE_PICKUP_ORDER = id => axios.delete(`/pickup/delete/pickup-request/${id}`)
