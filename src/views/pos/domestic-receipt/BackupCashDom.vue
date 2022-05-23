<template>
  <b-card
    title="Entri Resi Cash Domestic"
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
                  ok-only
                  ok-variant="info"
                  ok-title="Accept"
                  modal-class="modal-info"
                  title="Detail Koli"
                >
                  <b-card-text>
                    Biscuit chocolate cake gummies. Lollipop I love macaroon bear claw caramels. I love marshmallow tiramisu I love
                    fruitcake I love gummi bears. Carrot cake topping liquorice. Pudding caramels liquorice sweet I love. Donut powder
                    cupcake ice cream tootsie roll jelly.
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
                    id="h-name"
                    v-model="formData.ddk_destination"
                    placeholder="DDK Tujuan"
                  />
                </b-form-group>
              </b-col>

            </b-row>
          </b-col>
        </b-row>

        <b-row>
          <app-collapse
              class="accordion-sml"
              type="margin"
            >
              <b-col lg="6">
                <app-collapse-item :isVisible="true" title="Rincian Pengirim">
                    <b-col cols="12">
                      <b-form-group
                        label="Cari Pengirim"
                        label-for="h-pengirim"
                      >
                        <v-select
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
                          label-for="h-sender-name"
                        >
                          <b-form-input
                            id="h-sender-name"
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
                  </app-collapse-item>
              </b-col>
          </app-collapse>
        </b-row>

        <b-row>
          <b-col lg="6">
            <app-collapse
              class="accordion-sml"
              type="margin"
            >

              <app-collapse-item :isVisible="true" title="Referensi">
                Cheesecake cotton candy bonbon muffin cupcake tiramisu croissant. Tootsie roll sweet candy bear claw chupa chups lollipop toffee. Macaroon donut liquorice powder candy carrot cake macaroon fruitcake. Cookie toffee lollipop cotton candy ice cream dragée soufflé. Cake tiramisu lollipop wafer pie soufflé dessert tart. Biscuit ice cream pie apple pie topping oat cake dessert. Soufflé icing caramels. Chocolate cake icing ice cream macaroon pie cheesecake liquorice apple pie.
              </app-collapse-item>

              <app-collapse-item :isVisible="true" title="Asuransi">
                <b-col cols="12">
                  <b-form-group
                    label="Nilai Barang"
                    label-for="h-special-instructions"
                  >
                    <b-form-input
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
                    label="No. Asuransi"
                    label-for="h-kontak-name"
                  >
                    <b-form-input
                      id="h-kontak-name"
                      v-model="formData.kontak"
                      placeholder="No. Asuransi"
                    />
                  </b-form-group>
                </b-col>
              </app-collapse-item>

              <app-collapse-item :isVisible="true" title="Biaya Tambahan">
                Cheesecake cotton candy bonbon muffin cupcake tiramisu croissant. Tootsie roll sweet candy bear claw chupa chups lollipop toffee. Macaroon donut liquorice powder candy carrot cake macaroon fruitcake. Cookie toffee lollipop cotton candy ice cream dragée soufflé. Cake tiramisu lollipop wafer pie soufflé dessert tart. Biscuit ice cream pie apple pie topping oat cake dessert. Soufflé icing caramels. Chocolate cake icing ice cream macaroon pie cheesecake liquorice apple pie.
              </app-collapse-item>

              <app-collapse-item :isVisible="true" title="Pick Up">
                Cheesecake cotton candy bonbon muffin cupcake tiramisu croissant. Tootsie roll sweet candy bear claw chupa chups lollipop toffee. Macaroon donut liquorice powder candy carrot cake macaroon fruitcake. Cookie toffee lollipop cotton candy ice cream dragée soufflé. Cake tiramisu lollipop wafer pie soufflé dessert tart. Biscuit ice cream pie apple pie topping oat cake dessert. Soufflé icing caramels. Chocolate cake icing ice cream macaroon pie cheesecake liquorice apple pie.
              </app-collapse-item>

              <app-collapse-item :isVisible="true" title="Alasan">
                Cheesecake cotton candy bonbon muffin cupcake tiramisu croissant. Tootsie roll sweet candy bear claw chupa chups lollipop toffee. Macaroon donut liquorice powder candy carrot cake macaroon fruitcake. Cookie toffee lollipop cotton candy ice cream dragée soufflé. Cake tiramisu lollipop wafer pie soufflé dessert tart. Biscuit ice cream pie apple pie topping oat cake dessert. Soufflé icing caramels. Chocolate cake icing ice cream macaroon pie cheesecake liquorice apple pie.
              </app-collapse-item>
            </app-collapse>
          </b-col>
          <b-col lg="6">
            <app-collapse
              class="accordion-sml"
              type="margin"
            >
              <app-collapse-item :isVisible="true" title="Rincian Penerima">
                <b-col cols="12">
                  <b-form-group
                    label="Cari Penerima"
                    label-for="h-penerima"
                  >
                    <v-select
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
              </app-collapse-item>

              <app-collapse-item :isVisible="true" title="Rujukan Kiriman">
                <b-col cols="12">
                  <b-form-group
                    label="Keterangan Barang"
                    label-for="h-item-description"
                  >
                    <b-form-input
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
                      id="h-special-instructions"
                      v-model="formData.special_instructions"
                      placeholder="Intruksi Khusus"
                    />
                  </b-form-group>
                </b-col>
              </app-collapse-item>

              <app-collapse-item :isVisible="true" title="Surcharge">
                Cheesecake cotton candy bonbon muffin cupcake tiramisu croissant. Tootsie roll sweet candy bear claw chupa chups lollipop toffee. Macaroon donut liquorice powder candy carrot cake macaroon fruitcake. Cookie toffee lollipop cotton candy ice cream dragée soufflé. Cake tiramisu lollipop wafer pie soufflé dessert tart. Biscuit ice cream pie apple pie topping oat cake dessert. Soufflé icing caramels. Chocolate cake icing ice cream macaroon pie cheesecake liquorice apple pie.
              </app-collapse-item>

              <app-collapse-item :isVisible="true" title="Pengurangan Biaya">
                Cheesecake cotton candy bonbon muffin cupcake tiramisu croissant. Tootsie roll sweet candy bear claw chupa chups lollipop toffee. Macaroon donut liquorice powder candy carrot cake macaroon fruitcake. Cookie toffee lollipop cotton candy ice cream dragée soufflé. Cake tiramisu lollipop wafer pie soufflé dessert tart. Biscuit ice cream pie apple pie topping oat cake dessert. Soufflé icing caramels. Chocolate cake icing ice cream macaroon pie cheesecake liquorice apple pie.
              </app-collapse-item>

              <app-collapse-item :isVisible="true" title="Pembayaran">
                Cheesecake cotton candy bonbon muffin cupcake tiramisu croissant. Tootsie roll sweet candy bear claw chupa chups lollipop toffee. Macaroon donut liquorice powder candy carrot cake macaroon fruitcake. Cookie toffee lollipop cotton candy ice cream dragée soufflé. Cake tiramisu lollipop wafer pie soufflé dessert tart. Biscuit ice cream pie apple pie topping oat cake dessert. Soufflé icing caramels. Chocolate cake icing ice cream macaroon pie cheesecake liquorice apple pie.
              </app-collapse-item>
            </app-collapse>
          </b-col>
        </b-row>

      </b-form>
    </validation-observer>
  </b-card>
</template>

<script>
import {
  BCard, BRow, BCol, BFormGroup, BFormInput, BFormTextarea, BFormDatepicker, BModal, VBModal, BCardText, BFormInvalidFeedback, BInputGroupPrepend, BInputGroup, BForm, BButton,
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
import branchOp from '@/@fake-db/data/other/branch'
import officeOp from '@/@fake-db/data/other/office'
import companyId from '@/@fake-db/data/other/companyId'
import idAccount from '@/@fake-db/data/other/idAccount'
import idEmployee from '@/@fake-db/data/other/idEmployee'
import userGroup from '@/@fake-db/data/other/userGroup'
import yesNo from '@/@fake-db/data/other/yesNo'
import jobOp from '@/@fake-db/data/other/jobOp'

export default {
  components: {
    BCard,
    BCardText,
    BRow,
    BCol,
    BModal,
    BFormGroup,
    BFormInput,
    BFormTextarea,
    BFormDatepicker,
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
        
        pengirim: null,
      }
    }
  },
  methods: {
    getValidationState({ dirty, validated, valid = null }) {
      return dirty || validated ? valid : null;
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
@import '@core/scss/vue/libs/vue-select.scss';
@import '@assets/scss/custom/accordion-custom.scss';
</style>
