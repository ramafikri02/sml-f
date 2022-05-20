import axios from '@axios'

export const GET_COVERAGE_AREA = params => axios.get(`/datamaster/get/coverage-area?${params}`)

export const GET_COVERAGE_AREA_BY_ID = id => axios.get(`/datamaster/get/coverage-area/${id}`)

export const ADD_COVERAGE_AREA = data => axios.post('/datamaster/create/coverage-area/', data)

export const UPDATE_COVERAGE_AREA = data => axios.put(`/datamaster/update/coverage-area/${data.city_code}`, data)

export const DELETE_COVERAGE_AREA = id => axios.delete(`/datamaster/delete/coverage-area/${id}`)
