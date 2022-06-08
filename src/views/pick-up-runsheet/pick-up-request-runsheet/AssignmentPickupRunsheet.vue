<template>
  <b-card title="Penugasan Pick up Runsheet">

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
            <b-col cols="6">
              <b-form-group
                label="No. Pick up Report : "
                label-for="h-province-code"
                label-cols-md="5"
              >
                <b-form-input
                  id="h-user-code"
                  v-model="searchReceipt"
                />
              </b-form-group>
            </b-col>
            <b-col cols="4">
              <b-form-group>
                <v-select
                  id="h-province-code"
                  v-model="searchOption"
                  :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                  :options="filterPickup"
                  label="title"
                  placeholder="Pilih..."
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
    </b-row>

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
          v-if="props.column.field === 'no_pickup_report'"
        >
          <span class="font-weight-bold">{{ props.row.no_pickup_report }}</span>
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
              <b-dropdown-item @click="toUserEdit(props.row.no_pickup_report)">
                <feather-icon
                  icon="Edit2Icon"
                  class="mr-50"
                />
                <span>Ubah</span>
              </b-dropdown-item>
              <b-dropdown-item @click="toUserDelete(props.row.no_pickup_report)">
                <feather-icon
                  icon="PrinterIcon"
                  class="mr-50"
                />
                <span>Cetak</span>
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
  </b-card>
</template>

<script>
import {
  BAvatar, BRow, BCol, BButton, BCard, BBadge, BPagination, BFormGroup, BFormInput, BFormSelect, BDropdown, BDropdownItem,
} from 'bootstrap-vue'
import vSelect from 'vue-select'
import { VueGoodTable } from 'vue-good-table'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import store from '@/store/index'
import { mapGetters } from 'vuex'
import { BSpinner } from 'bootstrap-vue'

export default {
  components: {
    BRow,
    BCol,
    BCard,
    VueGoodTable,
    BAvatar,
    BButton,
    BBadge,
    BPagination,
    vSelect,
    BFormGroup,
    BFormInput,
    BFormSelect,
    BDropdown,
    BDropdownItem,
    BSpinner,
  },
  data() {
    return {
      filterPickup: [
        'Sudah Ditugaskan',
        'Belum Ditugaskan'
      ],
      pageLength: 10,
      dir: false,
      columns: [
        {
          label: 'No. Pick up Report',
          field: 'no_pickup_report',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Pickup COP',
          field: 'pickup_cop',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'No. SPPB',
          field: 'sppb_no',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Tanggal',
          field: 'date',
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
          label: 'Nama Customer',
          field: 'customer_name',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Alamat Customer',
          field: 'customer_address',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Jumlah',
          field: 'amount',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Kuantitas',
          field: 'quantity',
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
          label: 'Action',
          field: 'action',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
      ],
      rows: [],
      searchTerm: '',
    }
  },
  mounted() {
    // this.$store.dispatch('user/GET_USER', this.params);
  },
  computed: {
    // users() {
    //   this.loadingTable = false
    //   return this.$store.getters['user/getsUser'] === null
    //     ? []
    //     : this.$store.getters['user/getsUser'];
    // },

    statusVariant() {
      const statusColor = {
        /* eslint-disable key-spacing */
        'Aktif'      : 'light-success',
        'Tidak Aktif' : 'light-danger',
        /* eslint-enable key-spacing */
      }

      return status => statusColor[status]
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
    toUserAdd() {
      // this.$router.push({ path: '/masterdata/users/add' })
    },
    toUserEdit(id) {
      // this.$store.dispatch('user/GET_USER_BY_ID', id).then(() => {
      //   this.$router.push({ path: '/masterdata/users/edit' });
      // });
    },
    toUserDelete(id) {
      // this.$store.dispatch('user/DELETE_USER', id).then(() => {
      //   this.$store.dispatch('user/GET_USER', this.params)
          this.$toast({
            component: ToastificationContent,
            position: 'top-right',
            props: {
              title: `Berhasil hapus pengguna`,
              icon: 'ThumbsUpIcon',
              variant: 'success',
              text: `Anda telah berhasil menghapus pengguna ${id}!`,
            },
          })
      //     console.log(this.users)
      // });
    },

  },
}
</script>

<style lang="scss" >
@import '@core/scss/vue/libs/vue-good-table.scss';
@import '@assets/scss/custom/vgt-custom.scss';
</style>
