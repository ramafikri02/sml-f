export default [
  // *===============================================---*
  // *--------- Pick Up Order ---------------------------------------*
  // *===============================================---*
  {
    path: '/pickup/pickup-request',
    name: 'pickup-request-entry',
    component: () => import('@/views/pick-up/pick-up-order/PickupRequest.vue'),
  },
  {
    path: '/pickup/pickup-request/booking',
    name: 'pickup-request-booking',
    component: () => import('@/views/pick-up/pick-up-order/ListPickupRequest.vue'),
  },
  {
    path: '/pickup/pickup-request/assignment',
    name: 'pickup-request-assignment',
    component: () => import('@/views/pick-up/pick-up-order/AssignmentPickupRequest.vue'),
  },
  {
    path: '/pickup/pickup-request/reprint',
    name: 'pickup-request-reprint',
    component: () => import('@/views/pick-up/pick-up-order/ReprintPickupRequest.vue'),
  },
  {
    path: '/pickup/pickup-request/customer-pickup-request',
    name: 'pickup-request-customer',
    component: () => import('@/views/pick-up/pick-up-order/CustomerPickupRequest.vue'),
  },
  // *===============================================---*
  // *--------- Pick Up Missed ---------------------------------------*
  // *===============================================---*
  {
    path: '/pickup/pickup-miss',
    name: 'pickup-miss-entry',
    component: () => import('@/views/pick-up/pick-up-missed/EntryPickupMiss.vue'),
  },
  {
    path: '/pickup/pickup-miss/booking',
    name: 'pickup-miss-booking',
    component: () => import('@/views/pick-up/pick-up-missed/BookingPickupMiss.vue'),
  },
  {
    path: '/pickup/pickup-miss/reprint',
    name: 'pickup-miss-reprint',
    component: () => import('@/views/pick-up/pick-up-missed/ReprintPickupMiss.vue'),
  },
  {
    path: '/pickup/pickup-miss/void',
    name: 'pickup-miss-void',
    component: () => import('@/views/pick-up/pick-up-missed/VoidPickupMiss.vue'),
  },
  // *===============================================---*
  // *--------- Pick Up Confirmation ---------------------------------------*
  // *===============================================---*
  {
    path: '/pickup/pickup-confirmation',
    name: 'pickup-confirmation-entry',
    component: () => import('@/views/pick-up/pick-up-confirmation/EntryPickupConfirmation.vue'),
  },
  {
    path: '/pickup/pickup-confirmation/booking',
    name: 'pickup-confirmation-booking',
    component: () => import('@/views/pick-up/pick-up-confirmation/BookingPickupConfirmation.vue'),
  },
  {
    path: '/pickup/pickup-confirmation/reprint',
    name: 'pickup-confirmation-reprint',
    component: () => import('@/views/pick-up/pick-up-confirmation/ReprintPickupConfirmation.vue'),
  },
  // *===============================================---*
  // *--------- Pick Up Report ---------------------------------------*
  // *===============================================---*
  {
    path: '/pickup/pickup-request',
    name: 'pickup-request-report',
    component: () => import('@/views/pick-up/pick-up-report/PickupRequestReport.vue'),
  },
  {
    path: '/pickup/pickup-confirmation',
    name: 'pickup-confirmation-report',
    component: () => import('@/views/pick-up/pick-up-report/PickupConfirmationReport.vue'),
  },
  {
    path: '/pickup/pickup-miss',
    name: 'pickup-miss-report',
    component: () => import('@/views/pick-up/pick-up-report/PickupMissedReport.vue'),
  },
]