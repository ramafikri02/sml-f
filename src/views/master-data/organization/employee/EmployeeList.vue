<template>
  <b-card title="Daftar Karyawan">

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
            @click="toEmployeeAdd()"
          >
            <span class="text-nowrap text-white">Tambah Karyawan</span>
          </b-button>
        </div>
      </b-col>
    </b-row>

    <!-- table -->
    <vue-good-table
      :columns="columns"
      :rows="employees"
      :rtl="direction"
      :search-options="{
        enabled: true,
        externalQuery: searchTerm }"
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

        <!-- Column: Code -->
        <span
          v-if="props.column.field === 'employee_code'"
        >
          <span class="font-weight-bold">{{ props.row.employee_code }}</span>
        </span>

        <!-- Column: Name -->
        <span v-else-if="props.column.field === 'name'">
          {{ props.row.first_name }} {{ props.row.middle_name }} {{ props.row.last_name }}
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
              <b-dropdown-item @click="toEmployeeEdit(props.row.employee_code)">
                <feather-icon
                  icon="Edit2Icon"
                  class="mr-50"
                />
                <span>Ubah</span>
              </b-dropdown-item>
              <b-dropdown-item @click="toEmployeeDelete(props.row.employee_code)">
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
  },
  data() {
    return {
      pageLength: 10,
      dir: false,
      columns: [
        {
          label: 'Kode Karyawan',
          field: 'employee_code',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Nama Karyawan',
          field: 'name',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Cabang Pengguna',
          field: 'branch',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Dbranch Code Pengguna',
          field: 'branch',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Karyawan Departemen',
          field: 'department_code',
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
    this.$store.dispatch('employee/GET_EMPLOYEE', this.params);
  },
  computed: {
    employees() {
      return this.$store.getters['employee/getsEmployee'] === null
        ? []
        : this.$store.getters['employee/getsEmployee'];
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
    toEmployeeAdd() {
      this.$router.push({ path: '/masterdata/employees/add' })
    },
    toEmployeeEdit(id) {
      this.$store.dispatch('employee/GET_EMPLOYEE_BY_ID', id).then(() => {
        this.$router.push({ path: '/masterdata/employees/edit' });
      });
    },
    toEmployeeDelete(id) {
      this.$swal({
        title: 'Apakah kamu yakin?',
        text: "Anda tidak akan dapat mengembalikan ini!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Ya, hapus!',
        customClass: {
          confirmButton: 'btn btn-primary',
          cancelButton: 'btn btn-outline-danger ml-1',
        },
        buttonsStyling: false,
      }).then(result => {
        if (result.value) {
          this.$store.dispatch('employee/DELETE_EMPLOYEE', id).then(() => {
            this.$store.dispatch('employee/GET_EMPLOYEE', this.params)
              console.log(this.employees)
          });
          this.$swal({
            icon: 'success',
            title: 'Dihapus!',
            text: 'Data telah dihapus.',
            customClass: {
              confirmButton: 'btn btn-success',
            },
          })
        }
      })
    },

  },
}
</script>

<style lang="scss" >
@import '@core/scss/vue/libs/vue-good-table.scss';
@import '@core/scss/vue/libs/vue-sweetalert.scss';
@import '@assets/scss/custom/vgt-custom.scss';
</style>
