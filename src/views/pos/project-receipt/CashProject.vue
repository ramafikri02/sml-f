<template>
  <b-card
    title="Entri Resi Cash Project"
  >
    <validation-observer
      #default="{ handleSubmit }"
      ref="refFormObserver"
    >
      <b-form
        @submit.prevent="handleSubmit(onSubmit)"
        @reset.prevent="resetForm"
      >
        <b-row>

          <b-col cols="6">
            <validation-provider
              #default="validationContext"
              name="Tanggal"
              rules="required"
            >
              <b-form-group
                label="Tanggal"
                label-for="h-date"
              >
                <b-form-datepicker
                  id="h-date"
                  v-model="formData.date"
                  :state="getValidationState(validationContext)"
                  :show-decade-nav="true"
                  :hide-header="true"
                  placeholder="Tanggal"
                  locale="id"
                />
                <b-form-invalid-feedback>
                  {{ validationContext.errors[0] }}
                </b-form-invalid-feedback>
              </b-form-group>
            </validation-provider>
          </b-col>
          <b-col cols="6">
            <b-button
              v-ripple.400="'rgba(0, 207, 232, 0.15)'"
              v-b-modal.modal-info
              variant="info"
              class="mt-2"
            >
              Rincian Berat & Koli
            </b-button>
          </b-col>

          <b-col lg="6">
            <b-row>
              <b-col cols="12">
                <b-form-group
                  label="No. Resi"
                  label-for="h-receipt-number"
                >
                  <cleave
                    id="h-receipt-number"
                    v-model="formData.receipt_number"
                    class="form-control"
                    :raw="false"
                    :options="options.numberOnly"
                    placeholder="Nomor Resi"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="12">
                <validation-provider
                  #default="validationContext"
                  name="Jenis Kiriman"
                  rules="required"
                >
                  <b-form-group
                    label="Jenis Kiriman"
                    label-for="h-branch"
                    :state="getValidationState(validationContext)"
                  >
                    <v-select
                      v-uppercase
                      id="h-branch"
                      v-model="formData.branch"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      :options="branchOp"
                      label="title"
                      placeholder="Pilih..."
                    />
                    <b-form-invalid-feedback :state="getValidationState(validationContext)">
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
              <b-col cols="12">
                <validation-provider
                  #default="validationContext"
                  name="Jenis Layanan"
                  rules="required"
                >
                  <b-form-group
                    label="Jenis Layanan"
                    label-for="h-branch"
                    :state="getValidationState(validationContext)"
                  >
                    <v-select
                      v-uppercase
                      id="h-branch"
                      v-model="formData.branch"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      :options="branchOp"
                      label="title"
                      placeholder="Pilih..."
                    />
                    <b-form-invalid-feedback :state="getValidationState(validationContext)">
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
              <b-col cols="12">
                <validation-provider
                  #default="validationContext"
                  name="Kota Tujuan"
                  rules="required"
                >
                  <b-form-group
                    label="Kota Tujuan"
                    label-for="h-branch"
                    :state="getValidationState(validationContext)"
                  >
                    <v-select
                      v-uppercase
                      id="h-branch"
                      v-model="formData.branch"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      :options="branchOp"
                      label="title"
                      placeholder="Pilih..."
                    />
                    <b-form-invalid-feedback :state="getValidationState(validationContext)">
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
              <b-col cols="12">
                <validation-provider
                  #default="validationContext"
                  name="Jenis Produk"
                  rules="required"
                >
                  <b-form-group
                    label="Jenis Produk"
                    label-for="h-branch"
                    :state="getValidationState(validationContext)"
                  >
                    <v-select
                      v-uppercase
                      id="h-branch"
                      v-model="formData.branch"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      :options="productTypeOp"
                      label="title"
                      placeholder="Pilih..."
                    />
                    <b-form-invalid-feedback :state="getValidationState(validationContext)">
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
              <b-col cols="12">
                <validation-provider
                  #default="validationContext"
                  name="Biaya Kirim"
                  rules="required"
                >
                  <b-form-group
                    label="Biaya Kirim"
                    label-for="h-shipping-cost"
                  >
                    <cleave
                      id="h-shipping-cost"
                      v-model="formData.shipping_cost"
                      :state="getValidationState(validationContext)"
                      class="form-control"
                      :raw="false"
                      :options="options.numberThousand"
                      placeholder="Biaya Kirim"
                    />
                    <b-form-invalid-feedback>
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>

              <!-- submit and reset -->
              <!-- <b-col offset-md="4">
                <b-button
                  v-ripple.400="'rgba(255, 255, 255, 0.15)'"
                  type="submit"
                  variant="primary"
                  class="mr-1"
                >
                  Submit
                </b-button>
                <b-button
                  v-ripple.400="'rgba(186, 191, 199, 0.15)'"
                  type="reset"
                  variant="danger"
                  class="mr-1"
                >
                  Reset
                </b-button>
              </b-col> -->
            </b-row>
          </b-col>

          <b-col lg="6">
            <b-row>
              <b-col cols="12">
                <b-modal
                  id="modal-info"
                  scrollable
                  ok-only
                  ok-variant="info"
                  ok-title="Tutup"
                  modal-class="modal-info"
                  title="Detail Koli"
                  size="xl"
                >
                  <b-card-text>
                    <!-- table -->
                      <vue-good-table
                        :columns="columns"
                        :rows="rows"
                      >
                        <template
                          slot="table-row"
                          slot-scope="props"
                        >

                          <span
                            v-if="props.column.field === 'no'"
                          >
                            <b-form-input
                              v-uppercase
                              id="h-detailkoli-no"
                              v-model="detailKoli.no"
                            />
                          </span>

                          <span
                            v-if="props.column.field === 'koli'"
                          >
                            <b-form-input
                              v-uppercase
                              id="h-detailkoli-koli"
                              v-model="detailKoli.koli"
                              v-on:change="countKoli"
                            />
                          </span>

                          <span
                            v-if="props.column.field === 'koli_weight'"
                          >
                            <b-form-input
                              v-uppercase
                              id="h-detailkoli-koli_weight"
                              v-model="detailKoli.koli_weight"
                              v-on:change="countKoli"
                            />
                          </span>

                          <span
                            v-if="props.column.field === 'actual_weight'"
                          >
                            <b-form-input
                              v-uppercase
                              id="h-detailkoli-actual_weight"
                              v-model="detailKoli.actual_weight"
                            />
                          </span>

                          <span
                            v-if="props.column.field === 'length'"
                          >
                            <b-form-input
                              v-uppercase
                              id="h-detailkoli-length"
                              v-model="detailKoli.length"
                              v-on:change="countKoli"
                            />
                          </span>

                          <span
                            v-if="props.column.field === 'width'"
                          >
                            <b-form-input
                              v-uppercase
                              id="h-detailkoli-width"
                              v-model="detailKoli.width"
                              v-on:change="countKoli"
                            />
                          </span>

                          <span
                            v-if="props.column.field === 'height'"
                          >
                            <b-form-input
                              v-uppercase
                              id="h-detailkoli-height"
                              v-model="detailKoli.height"
                              v-on:change="countKoli"
                            />
                          </span>

                          <span
                            v-if="props.column.field === 'volume'"
                          >
                            <b-form-input
                              v-uppercase
                              id="h-detailkoli-volume"
                              v-model="detailKoli.volume"
                            />
                          </span>

                          <span
                            v-if="props.column.field === 'description'"
                          >
                            <b-form-input
                              v-uppercase
                              id="h-detailkoli-description"
                              v-model="detailKoli.description"
                            />
                          </span>

                        </template>
                      </vue-good-table>

                      <b-button
                        v-ripple.400="'rgba(0, 207, 232, 0.15)'"
                        variant="secondary"
                        class="mt-2"
                        @click="addKoli()"
                      >
                        Tambah
                      </b-button>

                      <vue-good-table
                        :columns="columns2"
                        :rows="rows2"
                        class="mt-2"
                      >
                        <template
                          slot="table-row"
                          slot-scope="props"
                        >
                          <span v-if="props.column.field === 'no'">
                            {{ props.index+1 }}
                          </span>
                          <span v-else-if="props.column.field === 'hapus'">
                            <b-button
                              v-ripple.400="'rgba(0, 207, 232, 0.15)'"
                              variant="danger"
                              @click="removeKoli(props.index)"
                            >
                              Hapus
                            </b-button>
                          </span>
                        </template>
                      </vue-good-table>

                      <vue-good-table
                        :columns="columns3"
                        :rows="rows3"
                        class="mt-2"
                      >
                        <template
                          slot="table-row"
                          slot-scope="props"
                        >
                          <span v-if="props.column.field === 'no'">
                            {{ props.index+1 }}
                          </span>
                        </template>
                      </vue-good-table>
                  </b-card-text>
                </b-modal>
              </b-col>
              <b-col cols="12">
                <b-form-group
                  label="Total Koli"
                  label-for="h-receipt-number"
                >
                  <cleave
                    id="h-receipt-number"
                    v-model="formData.koli"
                    class="form-control"
                    :raw="false"
                    :options="options.numberOnly"
                    placeholder="Total Koli"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="12">
                <b-form-group
                  label="Total Berat Aktual"
                  label-for="h-receipt-number"
                >
                  <cleave
                    id="h-receipt-number"
                    v-model="formData.actual_weight"
                    class="form-control"
                    :raw="false"
                    :options="options.numberOnly"
                    placeholder="Total Berat Aktual"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="12">
                <b-form-group
                  label="Total Berat Dibulatkan"
                  label-for="h-receipt-number"
                >
                  <cleave
                    id="h-receipt-number"
                    v-model="formData.weight_rounded_up"
                    class="form-control"
                    :raw="false"
                    :options="options.numberOnly"
                    placeholder="Total Berat Dibulatkan"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="12">
                <b-form-group
                  label="Menggunakan Vendor"
                  label-for="h-vendor"
                >
                  <v-select
                    v-uppercase
                    id="h-vendor"
                    v-model="formData.vendor"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="yesNo"
                    label="title"
                    placeholder="Pilih..."
                  />
                </b-form-group>
              </b-col>
              <b-col cols="12">
                <b-form-group
                  label="Sales"
                  label-for="h-branch"
                >
                  <v-select
                    v-uppercase
                    id="h-branch"
                    v-model="formData.branch"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="branchOp"
                    label="title"
                    placeholder="Pilih..."
                  />
                </b-form-group>
              </b-col>
              <b-col cols="12">
                <b-form-group
                  label="DDK Tujuan"
                  label-for="h-name"
                >
                  <b-form-input
                    v-uppercase
                    id="h-name"
                    v-model="formData.ddk_destination"
                    placeholder="DDK Tujuan"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="12">
                <b-form-group
                  label="Leadtime"
                  label-for="h-leadtime"
                >
                  <cleave
                    id="h-leadtime"
                    v-model="formData.leadtime"
                    class="form-control"
                    :raw="false"
                    :options="options.numberOnly"
                    placeholder="Leadtime"
                  />
                </b-form-group>
              </b-col>

            </b-row>
          </b-col>
        </b-row>

        <app-collapse
          class="accordion-sml"
          type="margin"
        >
          <b-row>
            <b-col cols="6">

              <app-collapse-item :isVisible="true" title="Rincian Pengirim">
                <b-row>
                  <b-col cols="12">
                    <b-form-group
                      label="Cari Pengirim"
                      label-for="h-pengirim"
                    >
                      <v-select
                        v-uppercase
                        id="h-pengirim"
                        v-model="formData.pengirim"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="branchOp"
                        label="title"
                        placeholder="Pilih..."
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <validation-provider
                      #default="validationContext"
                      name="Nama"
                      rules="required"
                    >
                      <b-form-group
                        label="Nama"
                        label-for="h-receiver-name"
                      >
                        <b-form-input
                          v-uppercase
                          id="h-receiver-name"
                          v-model="formData.nama_pengirim"
                          :state="getValidationState(validationContext)"
                          placeholder="Nama"
                        />
                        <b-form-invalid-feedback>
                          {{ validationContext.errors[0] }}
                        </b-form-invalid-feedback>
                      </b-form-group>
                    </validation-provider>
                  </b-col>
                  <b-col cols="12">
                    <validation-provider
                      #default="validationContext"
                      name="Alamat"
                      rules="required"
                    >
                      <b-form-group
                        label="Alamat"
                        label-for="h-address"
                      >
                        <b-form-textarea
                          id="h-address"
                          v-model="formData.address"
                          :state="getValidationState(validationContext)"
                          placeholder="Alamat"
                        />
                        <b-form-invalid-feedback>
                          {{ validationContext.errors[0] }}
                        </b-form-invalid-feedback>
                      </b-form-group>
                    </validation-provider>
                  </b-col>
                  <b-col cols="12">
                    <validation-provider
                      #default="validationContext"
                      name="No Telepon"
                      rules="required"
                    >
                      <b-form-group
                        label="No Telepon"
                        label-for="h-phone-number"
                      >
                        <b-input-group>
                          <b-input-group-prepend is-text>
                            ID (+62)
                          </b-input-group-prepend>
                          <cleave
                            id="h-phone-number"
                            v-model="formData.phone_number"
                            class="form-control"
                            :raw="false"
                            placeholder="8xxx xxx xxxx"
                          />
                        </b-input-group>
                        <b-form-invalid-feedback>
                          {{ validationContext.errors[0] }}
                        </b-form-invalid-feedback>
                      </b-form-group>
                    </validation-provider>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="No Handphone"
                      label-for="h-phone-number"
                    >
                      <b-input-group>
                        <b-input-group-prepend is-text>
                          ID (+62)
                        </b-input-group-prepend>
                        <cleave
                          id="h-phone-number"
                          v-model="formData.phone_number"
                          class="form-control"
                          :raw="false"
                          placeholder="8xxx xxx xxxx"
                        />
                      </b-input-group>
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <validation-provider
                      #default="validationContext"
                      name="Email"
                      rules="required"
                    >
                      <b-form-group
                        label="Email"
                        label-for="h-email"
                      >
                        <b-form-input
                          v-uppercase
                          id="h-email"
                          type="email"
                          v-model="formData.email"
                          :state="getValidationState(validationContext)"
                          placeholder="Email"
                        />
                        <b-form-invalid-feedback>
                          {{ validationContext.errors[0] }}
                        </b-form-invalid-feedback>
                      </b-form-group>
                    </validation-provider>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="No. Fax"
                      label-for="h-fax-no"
                    >
                      <cleave
                        id="h-fax-no"
                        v-model="formData.fax"
                        class="form-control"
                        :raw="false"
                        :options="options.numberOnly"
                        placeholder="No. Fax"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Kontak"
                      label-for="h-kontak-name"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-kontak-name"
                        v-model="formData.kontak"
                        placeholder="Kontak"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Kode Pos"
                      label-for="h-postal-code"
                    >
                      <cleave
                        id="h-postal-code"
                        v-model="formData.fax"
                        class="form-control"
                        :raw="false"
                        :options="options.numberOnly"
                        placeholder="Kode Pos"
                      />
                    </b-form-group>
                  </b-col>
                </b-row>
              </app-collapse-item>
            </b-col>

            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Rincian Penerima">
                <b-row>
                  <b-col cols="12">
                    <b-form-group
                      label="Cari Penerima"
                      label-for="h-penerima"
                    >
                      <v-select
                        v-uppercase
                        id="h-penerima"
                        v-model="formData.penerima"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="branchOp"
                        label="title"
                        placeholder="Pilih..."
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <validation-provider
                      #default="validationContext"
                      name="Nama"
                      rules="required"
                    >
                      <b-form-group
                        label="Nama"
                        label-for="h-receiver-name"
                      >
                        <b-form-input
                          v-uppercase
                          id="h-receiver-name"
                          v-model="formData.nama_pengirim"
                          :state="getValidationState(validationContext)"
                          placeholder="Nama"
                        />
                        <b-form-invalid-feedback>
                          {{ validationContext.errors[0] }}
                        </b-form-invalid-feedback>
                      </b-form-group>
                    </validation-provider>
                  </b-col>
                  <b-col cols="12">
                    <validation-provider
                      #default="validationContext"
                      name="Alamat"
                      rules="required"
                    >
                      <b-form-group
                        label="Alamat"
                        label-for="h-address"
                      >
                        <b-form-textarea
                          id="h-address"
                          v-model="formData.address"
                          :state="getValidationState(validationContext)"
                          placeholder="Alamat"
                        />
                        <b-form-invalid-feedback>
                          {{ validationContext.errors[0] }}
                        </b-form-invalid-feedback>
                      </b-form-group>
                    </validation-provider>
                  </b-col>
                  <b-col cols="12">
                    <validation-provider
                      #default="validationContext"
                      name="No Telepon"
                      rules="required"
                    >
                      <b-form-group
                        label="No Telepon"
                        label-for="h-phone-number"
                      >
                        <b-input-group>
                          <b-input-group-prepend is-text>
                            ID (+62)
                          </b-input-group-prepend>
                          <cleave
                            id="h-phone-number"
                            v-model="formData.phone_number"
                            class="form-control"
                            :raw="false"
                            placeholder="8xxx xxx xxxx"
                          />
                        </b-input-group>
                        <b-form-invalid-feedback>
                          {{ validationContext.errors[0] }}
                        </b-form-invalid-feedback>
                      </b-form-group>
                    </validation-provider>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="No Handphone"
                      label-for="h-phone-number"
                    >
                      <b-input-group>
                        <b-input-group-prepend is-text>
                          ID (+62)
                        </b-input-group-prepend>
                        <cleave
                          id="h-phone-number"
                          v-model="formData.phone_number"
                          class="form-control"
                          :raw="false"
                          placeholder="8xxx xxx xxxx"
                        />
                      </b-input-group>
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <validation-provider
                      #default="validationContext"
                      name="Email"
                      rules="required"
                    >
                      <b-form-group
                        label="Email"
                        label-for="h-email"
                      >
                        <b-form-input
                          v-uppercase
                          id="h-email"
                          type="email"
                          v-model="formData.email"
                          :state="getValidationState(validationContext)"
                          placeholder="Email"
                        />
                        <b-form-invalid-feedback>
                          {{ validationContext.errors[0] }}
                        </b-form-invalid-feedback>
                      </b-form-group>
                    </validation-provider>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="No. Fax"
                      label-for="h-fax-no"
                    >
                      <cleave
                        id="h-fax-no"
                        v-model="formData.fax"
                        class="form-control"
                        :raw="false"
                        :options="options.numberOnly"
                        placeholder="No. Fax"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Kontak"
                      label-for="h-kontak-name"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-kontak-name"
                        v-model="formData.kontak"
                        placeholder="Kontak"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Kode Pos"
                      label-for="h-postal-code"
                    >
                      <cleave
                        id="h-postal-code"
                        v-model="formData.fax"
                        class="form-control"
                        :raw="false"
                        :options="options.numberOnly"
                        placeholder="Kode Pos"
                      />
                    </b-form-group>
                  </b-col>
                </b-row>
              </app-collapse-item>
            </b-col>

            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Referensi">
                <vue-good-table
                  :columns="colsReference"
                  :rows="rowsReference"
                >
                  <template
                    slot="table-row"
                    slot-scope="props"
                  >

                    <span
                      v-if="props.column.field === 'reference_choice'"
                    >
                      <v-select
                        v-uppercase
                        id="h-formReference-reference-choice"
                        v-model="formData.reference_choice"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="yesNo"
                        append-to-body
                        label="title"
                        placeholder="Pilih..."
                      />
                    </span>

                    <span
                      v-if="props.column.field === 'reference'"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-formReference-reference"
                        v-model="formData.reference"
                      />
                    </span>

                  </template>
                </vue-good-table>
              </app-collapse-item>
            </b-col>

            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Rujukan Kiriman">
                <b-row>
                  <b-col cols="12">
                    <b-form-group
                      label="Keterangan Barang"
                      label-for="h-item-description"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-item-description"
                        v-model="formData.item_description"
                        placeholder="Keterangan Barang"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Intruksi Khusus"
                      label-for="h-special-instructions"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-special-instructions"
                        v-model="formData.special_instructions"
                        placeholder="Intruksi Khusus"
                      />
                    </b-form-group>
                  </b-col>
                </b-row>
              </app-collapse-item>
            </b-col>

            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Asuransi">
                <b-row>
                  <b-col cols="12">
                    <b-form-group
                      label="Nilai Barang"
                      label-for="h-special-instructions"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-special-instructions"
                        v-model="formData.special_instructions"
                        placeholder="Nilai Barang"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Asuransi"
                      label-for="h-vendor"
                    >
                      <v-select
                        v-uppercase
                        id="h-vendor"
                        v-model="formData.vendor"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="yesNo"
                        label="title"
                        placeholder="Pilih..."
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Biaya Asuransi"
                      label-for="h-shipping-cost"
                    >
                      <cleave
                        id="h-shipping-cost"
                        v-model="formData.shipping_cost"
                        class="form-control"
                        :raw="false"
                        :options="options.numberThousand"
                        placeholder="Biaya Asuransi"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Isi Barang"
                      label-for="h-vendor"
                    >
                      <v-select
                        v-uppercase
                        id="h-vendor"
                        v-model="formData.vendor"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="itemContentsOp"
                        label="title"
                        placeholder="Pilih..."
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="No. Asuransi"
                      label-for="h-kontak-name"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-kontak-name"
                        v-model="formData.no_asuransi"
                        placeholder="No. Asuransi"
                      />
                    </b-form-group>
                  </b-col>
                </b-row>
              </app-collapse-item>
            </b-col>

            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Surcharge">
                <b-row>
                  <b-col cols="12">
                    <b-form-group
                      label="Jenis Barang"
                      label-for="h-item-type"
                    >
                      <v-select
                        v-uppercase
                        id="h-item-type"
                        v-model="formData.item_type"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="itemTypeOp"
                        label="title"
                        placeholder="Pilih..."
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Jenis Surcharge"
                      label-for="h-surcharge"
                    >
                      <v-select
                        v-uppercase
                        id="h-surcharge"
                        v-model="formData.surcharge"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="yesNo"
                        label="title"
                        placeholder="Pilih..."
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Biaya Surcharge"
                      label-for="h-surcharge-cost"
                    >
                      <cleave
                        id="h-surcharge-cost"
                        v-model="formData.surcharge_cost"
                        class="form-control"
                        :raw="false"
                        :options="options.numberThousand"
                        placeholder="Biaya Surcharge"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Keterangan Barang"
                      label-for="h-item-description"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-item-description"
                        v-model="formData.item_description"
                        placeholder="Keterangan Barang"
                      />
                    </b-form-group>
                  </b-col>
                </b-row>
              </app-collapse-item>
            </b-col>

            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Biaya Tambahan">
                <vue-good-table
                  :columns="colsAditionalCost"
                  :rows="rowsAditionalCost"
                >
                  <template
                    slot="table-row"
                    slot-scope="props"
                  >

                    <span
                      v-if="props.column.field === 'aditional_cost'"
                    >
                      <v-select
                        v-uppercase
                        id="h-formAditonCost-aditional-cost"
                        v-model="formData.aditional_cost"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="aditionalCostOp"
                        append-to-body
                        label="title"
                        placeholder="Pilih..."
                      />
                    </span>

                    <span
                      v-if="props.column.field === 'value'"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-formAditonCost-value"
                        v-model="formData.value"
                      />
                    </span>

                  </template>
                </vue-good-table>
              </app-collapse-item>
            </b-col>

            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Pengurangan Biaya">
                <b-col cols="12">
                  <b-row>
                    <b-col cols="7">
                      <b-form-group
                        label="Diskon"
                        label-for="h-pengirim"
                      >
                        <v-select
                          v-uppercase
                          id="h-pengirim"
                          v-model="formData.pengirim"
                          :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                          :options="branchOp"
                          label="title"
                          placeholder="Pilih..."
                        />
                      </b-form-group>
                    </b-col>
                    <b-col cols="5">
                      <b-form-group
                        class="mt-2"
                      >
                        <v-select
                          v-uppercase
                          id="h-pengirim"
                          v-model="formData.pengirim"
                          :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                          :options="branchOp"
                          label="title"
                          placeholder="Pilih..."
                        />
                      </b-form-group>
                    </b-col>
                  </b-row>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Rp"
                    label-for="h-shipping-cost"
                  >
                    <cleave
                      id="h-shipping-cost"
                      v-model="formData.shipping_cost"
                      class="form-control"
                      :raw="false"
                      :options="options.numberThousand"
                    />
                  </b-form-group>
                </b-col>
              </app-collapse-item>
            </b-col>

            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Pick Up">
                <b-row>
                  <b-col cols="8">
                    <b-form-group
                      label="Cari No. Pickup/SPBB"
                      label-for="h-nopickup-spbb"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-nopickup-spbb"
                        v-model="formData.item_description"
                        placeholder="Cari No. Pickup/SPBB"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="4">
                    <b-button
                      v-ripple.400="'rgba(0, 207, 232, 0.15)'"
                      v-b-modal.modal-info
                      variant="outline-info"
                      class="mt-2"
                    >
                      Cari
                    </b-button>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Supir"
                      label-for="h-courier"
                    >
                      <v-select
                        v-uppercase
                        id="h-courier"
                        v-model="formData.courier"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="yesNo"
                        label="title"
                        placeholder="Pilih..."
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Juru Antar"
                      label-for="h-surcharge"
                    >
                      <v-select
                        v-uppercase
                        id="h-surcharge"
                        v-model="formData.surcharge"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="yesNo"
                        label="title"
                        placeholder="Pilih..."
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Tanggal Pick Up"
                      label-for="h-date"
                    >
                      <b-form-datepicker
                        id="h-date"
                        v-model="formData.datePickUp"
                        :show-decade-nav="true"
                        :hide-header="true"
                        placeholder="Tanggal"
                        locale="id"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="12">
                    <b-form-group
                      label="Waktu Pick Up"
                      label-for="h-time"
                    >
                      <b-time
                        id="h-time"
                        v-model="formData.pickUp_time"
                        show-seconds
                        locale="id"
                      >
                        <div
                          class="d-flex"
                          dir="ltr"
                        >
                          <b-button
                            v-if="formData.pickUp_time"
                            size="sm"
                            variant="outline-danger"
                            @click="clearTime()"
                          >
                            Reset
                          </b-button>
                          <b-button
                            size="sm"
                            variant="outline-primary"
                            class="ml-auto"
                            @click="setNow()"
                          >
                            Atur Sekarang
                          </b-button>
                        </div>
                      </b-time>
                    </b-form-group>
                  </b-col>
                </b-row>
              </app-collapse-item>
            </b-col>

            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Pembayaran">
                <b-col cols="12">
                  <b-form-group
                    label="Cara Pembayaran"
                    label-for="h-payment-method"
                  >
                    <v-select
                      v-uppercase
                      id="h-payment-method"
                      v-model="formData.payment_method"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      :options="paymentMethodOp"
                      label="title"
                      placeholder="Pilih..."
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Nomor Kartu"
                    label-for="h-card-number"
                  >
                    <cleave
                      id="h-card-number"
                      v-model="formData.card_number"
                      class="form-control"
                      :raw="false"
                      :options="options.numberOnly"
                      placeholder="Nomor Kartu"
                    />
                  </b-form-group>
                </b-col>
              </app-collapse-item>
            </b-col>

            <b-col cols="6">
              <app-collapse-item :isVisible="true" title="Alasan">
              </app-collapse-item>
            </b-col>

          </b-row>
        </app-collapse>

      </b-form>
    </validation-observer>
  </b-card>
</template>

<script>
import {
  BCard, BRow, BCol, BFormGroup, BFormInput, BFormTextarea, BFormDatepicker, BTime, BModal, VBModal, BCardText, BFormInvalidFeedback, BInputGroupPrepend, BInputGroup, BForm, BButton,
} from 'bootstrap-vue'
import AppCollapse from '@core/components/app-collapse/AppCollapse.vue'
import AppCollapseItem from '@core/components/app-collapse/AppCollapseItem.vue'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required, alphaNum } from '@validations'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import Cleave from 'vue-cleave-component'
import 'cleave.js/dist/addons/cleave-phone.id'
import { VueGoodTable } from 'vue-good-table'
import branchOp from '@/@fake-db/data/other/branch'
import officeOp from '@/@fake-db/data/other/office'
import companyId from '@/@fake-db/data/other/companyId'
import idAccount from '@/@fake-db/data/other/idAccount'
import idEmployee from '@/@fake-db/data/other/idEmployee'
import userGroup from '@/@fake-db/data/other/userGroup'
import yesNo from '@/@fake-db/data/other/yesNo'
import jobOp from '@/@fake-db/data/other/jobOp'
import aditionalCostOp from '@/@fake-db/data/other/aditionalCost'
import itemContentsOp from '@/@fake-db/data/other/itemContents'
import itemTypeOp from '@/@fake-db/data/other/itemType'
import paymentMethodOp from '@/@fake-db/data/other/paymentMethod'
import productTypeOp from '@/@fake-db/data/other/productType'

export default {
  components: {
    BCard,
    BCardText,
    BRow,
    BCol,
    BModal,
    VueGoodTable,
    BFormGroup,
    BFormInput,
    BFormTextarea,
    BFormDatepicker,
    BTime,
    BInputGroupPrepend,
    BInputGroup,
    Cleave,
    BFormInvalidFeedback,
    BForm,
    BButton,
    vSelect,
    AppCollapse,
    AppCollapseItem,

    // Form Validation
    ValidationProvider,
    ValidationObserver,
  },
  directives: {
    Ripple,
    'b-modal': VBModal,
  },
  data() {
    return {
      required,
      alphaNum,
      branchOp,
      officeOp,
      companyId,
      idAccount,
      idEmployee,
      userGroup,
      yesNo,
      jobOp,

      aditionalCostOp,
      itemContentsOp,
      itemTypeOp,
      paymentMethodOp,
      productTypeOp,

      // Form Validation
      ValidationProvider,
      ValidationObserver,

      options: {
        numberOnly: {
          numeral: true,
          numeralThousandsGroupStyle: 'none'
        },
        numberThousand: {
          numeral: true,
        },
        phone_number: {
          phone: true,
          phoneRegionCode: 'ID',
        },
      },

      columns: [
        {
          label: 'No.',
          field: 'no',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Koli',
          field: 'koli',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Berat per Koli',
          field: 'koli_weight',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Berat Aktual',
          field: 'actual_weight',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Panjang (cm)',
          field: 'length',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Lebar',
          field: 'width',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Tinggi',
          field: 'height',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Volume',
          field: 'volume',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Ket',
          field: 'description',
          thClass: 'text-center',
          width: '50px'
        },
      ],

      rows: [
        {
          no: '',
          koli: '',
          koli_weight: '',
          actual_weight: '',
          length: '',
          width: '',
          height: '',
          volume: '',
          description: '',
        }
      ],

      columns2: [
        {
          label: 'No.',
          field: 'no',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Koli',
          field: 'koli',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Berat Aktual',
          field: 'actual_weight',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Panjang (cm)',
          field: 'length',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Lebar',
          field: 'width',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Tinggi',
          field: 'height',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Volume',
          field: 'volume',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Ket',
          field: 'description',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Hapus',
          field: 'hapus',
          thClass: 'text-center',
          width: '50px'
        },
      ],

      rows2: [],

      columns3: [
        {
          label: 'Total Koli',
          field: 'koli_total',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Total Berat Aktual',
          field: 'actual_weight_total',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Total Volume',
          field: 'volume_total',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Total Berat Aktual Dibebankan',
          field: 'actual_weight_charge',
          thClass: 'text-center',
          width: '50px'
        },
        {
          label: 'Total Berat Dibulatkan',
          field: 'actual_weight_rouded',
          thClass: 'text-center',
          width: '50px'
        },
      ],

      rows3: [],

      colsReference: [
        {
          label: 'Pilihan Referensi',
          field: 'reference_choice',
          thClass: 'text-center',
        },
        {
          label: 'Referensi',
          field: 'reference',
          thClass: 'text-center',
        }
      ],

      rowsReference: [
        {
          reference_choice: '',
          reference: '',
        }
      ],

      colsAditionalCost: [
        {
          label: 'Biaya Tambahan',
          field: 'aditional_cost',
          thClass: 'text-center',
        },
        {
          label: 'Nilai',
          field: 'value',
          thClass: 'text-center',
        }
      ],

      rowsAditionalCost: [
        {
          aditional_cost: '',
          value: '',
        }
      ],

      detailKoli: {
        no: '',
        koli: '',
        koli_weight: '',
        actual_weight: '',
        length: '',
        width: '',
        height: '',
        volume: '',
        description: '',
      },

      formData: {
        date: '',
        receipt_number: null,
        jenis_kiriman: null,
        service_type: null,
        destination: '',
        product_type: null,
        shipping_cost: null,
        koli: null,
        actual_weight: null,
        weight_rounded_up: null,
        vendor: null,
        sales: null,
        ddk_destination: '',
        leadtime: null,
        
        pengirim: null,

        pickUp_time: null,

        reference_choice: null,
        reference: '',

        aditional_cost: null,
        value: '',
      }
    }
  },
  methods: {
    countKoli: function(evt) {
      this.d_koli = parseInt(this.detailKoli.koli),
      this.d_leng = parseInt(this.detailKoli.length),
      this.d_widt = parseInt(this.detailKoli.width),
      this.d_heig = parseInt(this.detailKoli.height),
      this.detailKoli.volume = (this.d_leng*this.d_widt*this.d_heig)/this.cn_divider * this.d_koli;
    },
    detailKoliCount(value) {
      this.formData.koli = null;
      this.formData.actual_weight = null;
      this.formData.weight_rounded_up = null;
      this.formData.vendor = null;
      this.formData.sales = null;
      this.formData.ddk_destination = '';
      this.formData.leadtime = null;
      this.formData.pengirim = null;

      this.formData.pickUp_time = null;

      this.formData.aditional_cost = null;


      this.detailKoli.no = null;
      this.detailKoli.koli = null;
      this.detailKoli.length = null;
      this.detailKoli.width = null;
      this.detailKoli.height = null;
      this.detailKoli.volume = null;

      if (value == 'EXPRESS STANDARD PROJECT') {
        this.cn_divider = 6000
        console.log('ekspres')
      }
      else {
        this.cn_divider = 4000
        console.log('Reguler')
      }
    },
    addKoli() {
      if(this.detailKoli.no == null || this.detailKoli.no == '') {
        this.$toast({
          component: ToastificationContent,
          position: 'top-right',
          props: {
            title: `Gagal`,
            icon: 'AlertCircleIcon',
            variant: 'danger',
            text: `Nomor Resi harus di isi!`,
          },
        })
      }
      else {
        if( this.rows2.some(code => code.no === this.detailKoli.no)){
          this.$toast({
            component: ToastificationContent,
            position: 'top-right',
            props: {
              title: `Gagal tambah`,
              icon: 'AlertCircleIcon',
              variant: 'danger',
              text: `Data yang anda masukkan sudah ada, mohon ubah nomor!`,
            },
          })
        }
        else {
          this.rows2.push({
            no: this.detailKoli.no,
            koli: this.detailKoli.koli,
            actual_weight: this.detailKoli.actual_weight,
            length: this.detailKoli.length,
            width: this.detailKoli.width,
            height: this.detailKoli.height,
            volume: this.detailKoli.volume,
            description: this.detailKoli.description,
          })
          this.detailKoli.no = ''
        }
      }
    },
    removeKoli(idx) {
      this.rows2.splice(idx, 1);
    },
    getValidationState({ dirty, validated, valid = null }) {
      return dirty || validated ? valid : null;
    },
    setNow() {
      const now = new Date()
      // Grab the HH:mm:ss part of the time string
      this.formData.pickUp_time = now.toTimeString().slice(0, 8)
    },
    clearTime() {
      this.formData.pickUp_time = ''
    },
    resetForm() {
      this.formData = {
        date: '',
        receipt_number: null,
        shipping_cost: null,
        courier_code: '',
        name: '',
        branch: '',
        office: '',
        area: '',
        duty: null,
        vehicle: null,
        status: null,
      };
    },
    onSubmit() {
      const data = {
        courier_code: this.formData.courier_code,
        name: this.formData.name,
        phone_number: this.formData.phone_number,
        branch: this.formData.branch,
        office: this.formData.office,
        area: this.formData.area,
        duty: this.formData.duty,
        vehicle: this.formData.vehicle,
        status: this.formData.status,
      };

      console.log(data)

      this.$store.dispatch('courier/ADD_COURIER', data).then(() => {
        this.$toast({
          component: ToastificationContent,
          position: 'top-right',
          props: {
            title: `Berhasil tambah cabang`,
            icon: 'ThumbsUpIcon',
            variant: 'success',
            text: `Anda telah berhasil menambahkan ${data.name} di Provinsi ${data.branch}!`,
          },
        })
      });
    },
  },
}
</script>

<style lang="scss">
@import '@core/scss/vue/libs/vue-good-table.scss';
@import '@assets/scss/custom/vgt-custom.scss';
@import '@assets/scss/custom/accordion-custom.scss';
</style>
