<template>
  <b-card title="Lacak Resi">

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
                  :options="searchTracOptions"
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
        <app-collapse
          class="accordion-sml"
          type="margin"
        >
          <b-row>
            <b-col cols="12">
              <app-collapse-item :isVisible="true" title="Daftar Resi">
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
              </app-collapse-item>
            </b-col>
            
            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Daftar Tracking Label">
                <!-- table -->
                <vue-good-table
                  :columns="columns2"
                  :rows="users"
                  :rtl="direction"
                  :search-options="{
                    enabled: true,
                    externalQuery: searchTerm }"
                  :pagination-options="{
                    enabled: true,
                    perPage:pageLength
                  }"
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
              </app-collapse-item>
            </b-col>
            
            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Riwayat">
                <!-- table -->
                <vue-good-table
                  :rows="users"
                  :rtl="direction"
                  :search-options="{
                    enabled: true,
                    externalQuery: searchTerm }"
                  :pagination-options="{
                    enabled: true,
                    perPage:pageLength
                  }"
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
                        <b-dropdow
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
                        </b-dropdow>
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
              </app-collapse-item>
            </b-col>

          </b-row>
        </app-collapse>

      </b-col>
    </b-row>
  </b-card>
</template>

<script>
import {
  BRow, BCol, BButton, BCard, BFormGroup, BForm, BFormInput, BDropdown, BDropdownItem,
} from 'bootstrap-vue'
import AppCollapse from '@core/components/app-collapse/AppCollapse.vue'
import AppCollapseItem from '@core/components/app-collapse/AppCollapseItem.vue'
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
    BDropdown,
    BDropdownItem,
    vSelect,
    AppCollapse,
    AppCollapseItem,
  },
  directives: {
    Ripple,
  },
  data() {
    return {
      searchTracOptions: [
        'No. AWB',
        'No. Referensi AWB',
        'Tracking Label',
        'Disbag Manifest',
        'Shipping Bag',
        'No. Delivery Record',
        'Nama Pengirim',
        'Nama Penerima',
        'Alamat Pengirim',
        'Alamat Penerima',
        'User Entry'
      ],

      loadingTable: true,
      pageLength: 10,
      dir: false,
      columns: [
        {
          label: 'No. Resi',
          field: 'user_code',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Pengirim',
          field: 'full_name',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Tanggal',
          field: 'branch_code',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Penerima',
          field: 'office_code',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Tujuan',
          field: 'user_group',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Layanan',
          field: 'status',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Kilo/Koli',
          field: 'status',
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
          label: 'Posisi Terakhir',
          field: 'status',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Posisi Kurir',
          field: 'status',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Foto POD',
          field: 'action',
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
      columns2: [
        {
          label: 'Label Tracking',
          field: 'user_code',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Kilo',
          field: 'full_name',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Status',
          field: 'full_name',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Posisi Terakhir',
          field: 'full_name',
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
      columns3: [
        {
          label: 'Riwayat',
          field: 'full_name',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Posisi',
          field: 'action',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
      ],
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
        this.$router.push({ path: '/masterdata/users/edit' });
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
@import '@core/scss/vue/libs/vue-sweetalert.scss';
@import '@assets/scss/custom/vgt-custom.scss';
@import '@assets/scss/custom/accordion-custom.scss';
</style>
