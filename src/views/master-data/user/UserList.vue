<template>
  <b-card title="Daftar Pengguna">

    <!-- search input -->
    <b-row>
      <b-col
        cols="6"
      >
        <div class="custom-search d-flex justify-content-start">
          <b-form-group>
            <div class="d-flex align-items-center">
              <label class="mr-1">Search</label>
              <b-form-input
                v-model="searchTerm"
                placeholder="Search"
                type="text"
                class="d-inline-block"
              />
            </div>
          </b-form-group>
        </div>
      </b-col>
      <b-col
        cols="6"
      >
        <div class="d-flex justify-content-end">
          <b-button
            variant="primary"
            @click="toUserAdd()"
          >
            <span class="text-nowrap text-white">Tambah Pengguna</span>
          </b-button>
        </div>
      </b-col>
    </b-row>

    <!-- table -->
    <vue-good-table
      :columns="columns"
      :rows="users"
      :rtl="direction"
      :search-options="{
        enabled: true,
        externalQuery: searchTerm }"
      :pagination-options="{
        enabled: true,
        perPage:pageLength
      }"
      :line-numbers="true"
      :isLoading="loadingTable"
      styleClass="vgt-table condensed">
    >
      <template slot="loadingContent">
        <div>
          <b-spinner label="Loading..." />
        </div>
      </template>
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
              <b-dropdown-item @click="toUserEdit(props.row.user_code)">
                <feather-icon
                  icon="Edit2Icon"
                  class="mr-50"
                />
                <span>Ubah</span>
              </b-dropdown-item>
              <b-dropdown-item @click="toUserDelete(props.row.user_code)">
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
  </b-card>
</template>

<script>
import {
  BAvatar, BRow, BCol, BButton, BCard, BBadge, BPagination, BFormGroup, BFormInput, BFormSelect, BDropdown, BDropdownItem,
} from 'bootstrap-vue'
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
    BFormGroup,
    BFormInput,
    BFormSelect,
    BDropdown,
    BDropdownItem,
    BSpinner,
  },
  data() {
    return {
      loadingTable: true,
      pageLength: 10,
      dir: false,
      columns: [
        {
          label: 'Kode Pengguna',
          field: 'user_code',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Nama Pengguna',
          field: 'full_name',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Kode Cabang',
          field: 'branch_code',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Kode Kantor',
          field: 'office_code',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Grup Pengguna',
          field: 'user_group',
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
      searchTerm: '',
    }
  },
  mounted() {
    this.$store.dispatch('user/GET_USER', this.params);
  },
  computed: {
    users() {
      this.loadingTable = false
      return this.$store.getters['user/getsUser'] === null
        ? []
        : this.$store.getters['user/getsUser'];
    },

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
      this.$router.push({ path: '/masterdata/users/add' })
    },
    toUserEdit(id) {
      this.$store.dispatch('user/GET_USER_BY_ID', id).then(() => {
        this.$router.push({ name: 'pickup-request-saved', params: {id} });
      });
    },
    toUserDelete(id) {
      this.$store.dispatch('user/DELETE_USER', id).then(() => {
        this.$store.dispatch('user/GET_USER', this.params)
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
          console.log(this.users)
      });
    },

  },
}
</script>

<style lang="scss" >
@import '@core/scss/vue/libs/vue-good-table.scss';
@import '@assets/scss/custom/vgt-custom.scss';
</style>
