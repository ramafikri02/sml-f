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
        <vue-good-table
          :columns="columns"
          :rows="rows"
          :rtl="direction"
          :pagination-options="{
            enabled: true,
            perPage:pageLength
          }"
          :line-numbers="true"
          styleClass="vgt-table condensed">
        >
          <template
            slot="table-row"
            slot-scope="props"
          >

            <!-- Column: Name -->
            <span
              v-if="props.column.field === 'user_code'"
            >
              <span class="font-weight-bold">{{ props.row.user_code }}</span>
            </span>

            <!-- Column: Status -->
            <span v-else-if="props.column.field === 'status'">
              <b-badge :variant="statusVariant(props.row.status)">
                {{ props.row.status }}
              </b-badge>
            </span>

            <!-- Column: Action -->
            <span v-else-if="props.column.field === 'action'">
              <span>
                <b-dropdown
                  variant="link"
                  toggle-class="text-decoration-none"
                  no-caret
                >
                  <template v-slot:button-content>
                    <feather-icon
                      icon="MoreVerticalIcon"
                      size="16"
                      class="text-body align-middle mr-25"
                    />
                  </template>
                  <b-dropdown-item @click="toBranchEdit(props.row.branch_code)">
                    <feather-icon
                      icon="Edit2Icon"
                      class="mr-50"
                    />
                    <span>Ubah</span>
                  </b-dropdown-item>
                  <b-dropdown-item @click="toBranchDelete(props.row.branch_code)">
                    <feather-icon
                      icon="TrashIcon"
                      class="mr-50"
                    />
                    <span>Hapus</span>
                  </b-dropdown-item>
                </b-dropdown>
              </span>
            </span>

            <!-- Column: Common -->
            <span v-else>
              {{ props.formattedRow[props.column.field] }}
            </span>
          </template>

          <!-- pagination -->
          <template
            slot="pagination-bottom"
            slot-scope="props"
          >
            <div class="d-flex justify-content-between flex-wrap">
              <div class="d-flex align-items-center mb-0 mt-1">
                <span class="text-nowrap ">
                  Showing 1 to
                </span>
                <b-form-select
                  v-model="pageLength"
                  :options="['10','20','30']"
                  class="mx-1"
                  @input="(value)=>props.perPageChanged({currentPerPage:value})"
                />
                <span class="text-nowrap"> of {{ props.total }} entries </span>
              </div>
              <div>
                <b-pagination
                  :value="1"
                  :total-rows="props.total"
                  :per-page="pageLength"
                  first-number
                  last-number
                  align="right"
                  prev-class="prev-item"
                  next-class="next-item"
                  class="mt-1 mb-0"
                  @input="(value)=>props.pageChanged({currentPage:value})"
                >
                  <template #prev-text>
                    <feather-icon
                      icon="ChevronLeftIcon"
                      size="18"
                    />
                  </template>
                  <template #next-text>
                    <feather-icon
                      icon="ChevronRightIcon"
                      size="18"
                    />
                  </template>
                </b-pagination>
              </div>
            </div>
          </template>
        </vue-good-table>
      </b-col>
    </b-row>
  </b-card>
</template>

<script>
import {
  BRow, BCol, BButton, BCard, BFormGroup, BForm, BFormInput, BFormSelect, BPagination
} from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'
import { VueGoodTable } from 'vue-good-table'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import store from '@/store/index'

export default {
  components: {
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
      columns: [
        {
          label: 'No.',
          field: 'no',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'No. Pick up Order',
          field: 'no_picup_order',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'No. SPPB',
          field: 'no_sppb',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Tanggal Order',
          field: 'pickup_date',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Tanggal Pickup Ready Time',
          field: 'pickup_time',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Nama Akun',
          field: 'account_name',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Koli',
          field: 'koli',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Berat',
          field: 'weight',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Keterangan',
          field: 'total_cost',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Nama Kurir',
          field: 'courier_name',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Status',
          field: 'status',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Action',
          field: 'action',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
      ],
      rows: [],
    }
  },
  mounted() {
    
  },
  computed: {
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
    
  },
}
</script>

<style lang="scss" >
@import '@core/scss/vue/libs/vue-good-table.scss';
@import '@core/scss/vue/libs/vue-sweetalert.scss';
@import '@assets/scss/custom/vgt-custom.scss';
</style>
