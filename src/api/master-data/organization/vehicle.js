import axios from '@axios'

export const GET_VEHICLE = params => axios.get(`/datamaster/get/vehicle?${params}`)

export const GET_VEHICLE_BY_ID = id => axios.get(`/datamaster/get/vehicle/${id}`)

export const ADD_VEHICLE = data => axios.post('/datamaster/create/vehicle/', data)

export const UPDATE_VEHICLE = data => axios.put(`/datamaster/update/vehicle/${data.vehicle_code}`, data)

export const DELETE_VEHICLE = id => axios.delete(`/datamaster/delete/vehicle/${id}`)
