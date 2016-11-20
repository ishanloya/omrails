require 'test_helper'

class WardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ward = wards(:one)
  end

  test "should get index" do
    get wards_url
    assert_response :success
  end

  test "should get new" do
    get new_ward_url
    assert_response :success
  end

  test "should create ward" do
    assert_difference('Ward.count') do
      post wards_url, params: { ward: { amc_labour_female: @ward.amc_labour_female, amc_labour_male: @ward.amc_labour_male, comm_est: @ward.comm_est, corporator: @ward.corporator, corporator_number: @ward.corporator_number, edu_est: @ward.edu_est, hook_loader: @ward.hook_loader, households: @ward.households, inspector: @ward.inspector, inspector_number: @ward.inspector_number, jawan: @ward.jawan, jawan_number: @ward.jawan_number, med_est: @ward.med_est, pvt_labour_female: @ward.pvt_labour_female, pvt_labour_male: @ward.pvt_labour_male, skip_loader: @ward.skip_loader, total_labour_female: @ward.total_labour_female, total_labour_male: @ward.total_labour_male, v_407: @ward.v_407, v_cyclericks: @ward.v_cyclericks, v_haathgadi: @ward.v_haathgadi, v_hydraulicauto: @ward.v_hydraulicauto, v_loadingauto: @ward.v_loadingauto, v_tractor: @ward.v_tractor, ward_name: @ward.ward_name, ward_number: @ward.ward_number, ward_officer: @ward.ward_officer, ward_officer_number: @ward.ward_officer_number, waste_dry: @ward.waste_dry, waste_dry_qty: @ward.waste_dry_qty, waste_haz_qty: @ward.waste_haz_qty, waste_org: @ward.waste_org, waste_org_qty: @ward.waste_org_qty, zone: @ward.zone } }
    end

    assert_redirected_to ward_url(Ward.last)
  end

  test "should show ward" do
    get ward_url(@ward)
    assert_response :success
  end

  test "should get edit" do
    get edit_ward_url(@ward)
    assert_response :success
  end

  test "should update ward" do
    patch ward_url(@ward), params: { ward: { amc_labour_female: @ward.amc_labour_female, amc_labour_male: @ward.amc_labour_male, comm_est: @ward.comm_est, corporator: @ward.corporator, corporator_number: @ward.corporator_number, edu_est: @ward.edu_est, hook_loader: @ward.hook_loader, households: @ward.households, inspector: @ward.inspector, inspector_number: @ward.inspector_number, jawan: @ward.jawan, jawan_number: @ward.jawan_number, med_est: @ward.med_est, pvt_labour_female: @ward.pvt_labour_female, pvt_labour_male: @ward.pvt_labour_male, skip_loader: @ward.skip_loader, total_labour_female: @ward.total_labour_female, total_labour_male: @ward.total_labour_male, v_407: @ward.v_407, v_cyclericks: @ward.v_cyclericks, v_haathgadi: @ward.v_haathgadi, v_hydraulicauto: @ward.v_hydraulicauto, v_loadingauto: @ward.v_loadingauto, v_tractor: @ward.v_tractor, ward_name: @ward.ward_name, ward_number: @ward.ward_number, ward_officer: @ward.ward_officer, ward_officer_number: @ward.ward_officer_number, waste_dry: @ward.waste_dry, waste_dry_qty: @ward.waste_dry_qty, waste_haz_qty: @ward.waste_haz_qty, waste_org: @ward.waste_org, waste_org_qty: @ward.waste_org_qty, zone: @ward.zone } }
    assert_redirected_to ward_url(@ward)
  end

  test "should destroy ward" do
    assert_difference('Ward.count', -1) do
      delete ward_url(@ward)
    end

    assert_redirected_to wards_url
  end
end
