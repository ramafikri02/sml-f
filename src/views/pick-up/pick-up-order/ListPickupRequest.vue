<template>
  <b-card title="Booking Pick up Order">

    <!-- search input -->
    <b-row>
      <b-col
        cols="12"
      >
        <b-form
          @submit.prevent="handleSubmit(onSubmit)"
          @reset.prevent="resetForm"
        >
          <b-row>
            <b-col cols="5">
              <b-form-group
                label="Cari Berdasarkan : "
                label-for="h-province-code"
                label-cols-md="5"
              >
                <v-select
                  id="h-province-code"
                  v-model="searchOption"
                  :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                  :options="filterAssignmentPickup"
                  label="title"
                  placeholder="Pilih..."
                />
              </b-form-group>
            </b-col>
            <b-col cols="3">
              <b-form-group>
                <b-form-input
                  id="h-user-code"
                  v-model="searchReceipt"
                />
              </b-form-group>
            </b-col>
            <b-col cols="2">
              <b-button
                v-ripple.400="'rgba(255, 255, 255, 0.15)'"
                type="submit"
                variant="primary"
                class="mr-1"
              >
                Cari
              </b-button>
            </b-col>
          </b-row>
        </b-form>
      </b-col>

      <b-col cols="12">
        <!-- table -->
        <b-table-simple
          hover
          small
          caption-top
          responsive
          class="rounded-bottom mb-0"
        >
          <b-thead head-variant="light">
            <b-tr>
              <b-th rowspan="2" v-for="field in fields" :key="field.key">{{ field.label }}</b-th>
              <b-th colspan="2" class="text-center">
                Status
              </b-th>
              <b-th  colspan="2" class="text-center">
                Klik
              </b-th>
            </b-tr>
            <b-tr>
              <b-th class="text-center">
                Data
              </b-th>
              <b-th>
                Pickup
              </b-th>
              <b-th>
                Ubah
              </b-th>
              <b-th>
                Batal
              </b-th>
            </b-tr>
          </b-thead>
          <b-tbody>
            <tr v-for="(item,i) in items" :key="i">
              <td>{{ i+1 }}</td>
              <td>{{ item.no_pickup_order }}</td>
              <td>{{ item.no_sppb }}</td>
              <td>{{ item.pickup_sysdate }}</td>
              <td>{{ item.pickup_time }}</td>
              <td>{{ item.pickup_account }}</td>
              <td>{{ item.pickup_qty }}</td>
              <td>{{ item.pickup_weight }}</td>
              <td>{{ item.pickup_description }}</td>
              <td>{{ item.pickup_weight }}</td>
              <td>{{ item.pickup_weight }}</td>
              <td></td>
              <td>
                <feather-icon
                  icon="Edit2Icon"
                  class="mr-50"
                  @click="toPickupEdit(item.no_pickup_order)"
                />
              </td>
              <td>
                <feather-icon
                  icon="Edit2Icon"
                  class="mr-50"
                  @click="toPickupVoid(item.no_pickup_order)"
                />
              </td>
            </tr>
          </b-tbody>
          <b-tfoot>
            <b-tr>
              <b-td
                colspan="14"
                class="text-right"
              >
                Total Rows: <b>{{ items.length }}</b>
              </b-td>
            </b-tr>
          </b-tfoot>
        </b-table-simple>
      </b-col>
    </b-row>
  </b-card>
</template>

<script>
import {
  BTableSimple, BThead, BTr, BTh, BTd, BTbody, BTfoot, BRow, BCol, BButton, BCard, BFormGroup, BForm, BFormInput, BFormSelect, BPagination
} from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'
import { VueGoodTable } from 'vue-good-table'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import store from '@/store/index'

export default {
  components: {
    BTableSimple,
    BThead,
    BTr,
    BTh,
    BTd,
    BTbody,
    BTfoot,
    BRow,
    BCol,
    BCard,
    VueGoodTable,
    BButton,
    BFormGroup,
    BForm,
    BFormInput,
    BFormSelect,
    BPagination,
    vSelect,
  },
  directives: {
    Ripple,
  },
  data() {
    return {
      filterAssignmentPickup: [
        'No. Pick up Order',
        'No. SPPB',
        'NAMA PELANGAN'
      ],

      searchOption: '',
      searchReceipt: '',

      pageLength: 10,
      fields: [
        { key: 'no', label: 'No.' },
        { key: 'pickup_order_no', label: 'No. Pick up Order' },
        { key: 'sppb_no', label: 'No. SPPB' },
        { key: 'pickupp_date', label: 'Tanggal Order' },
        { key: 'pickup_time', label: 'Tanggal Pickup Ready Time' },
        { key: 'pickup_account', label: 'Nama Akun' },
        { key: 'pickup_qty', label: 'Koli' },
        { key: 'pickup_weight', label: 'Berat' },
        { key: 'pickup_description', label: 'Keterangan' },
        { key: 'pickup_courier', label: 'Nama Kurir' },
      ],
    }
  },
  mounted() {
    this.$store.dispatch('pickup_request/GET_PICKUP_ORDER', this.params);
  },
  computed: {
    items() {
      return this.$store.getters['pickup_request/getsPickupOrder'] === null
        ? []
        : this.$store.getters['pickup_request/getsPickupOrder'];
    },

    direction() {
      if (store.state.appConfig.isRTL) {
        // eslint-disable-next-line vue/no-side-effects-in-computed-properties
        this.dir = true
        return this.dir
      }
      // eslint-disable-next-line vue/no-side-effects-in-computed-properties
      this.dir = false
      return this.dir
    },
  },
  methods: {
    toPickupEdit(id) {
      this.$router.push({ name: 'pickup-request-edit', params: {id} });
    },
    toPickupVoid(id) {
      this.$router.push({ name: 'pickup-request-saved', params: {id} });
    }
  },
}
</script>

<style lang="scss" >
@import '@core/scss/vue/libs/vue-sweetalert.scss';
@import '@assets/scss/custom/pickup-assignment-custom.scss';
</style>
