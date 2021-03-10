# frozen_string_literal: true

class BinsController < ApplicationController
  before_action :set_bin, only: %i[show edit update destroy]

  # GET /bins or /bins.json
  def index
    @bins = Bin.all
  end

  # GET /bins/1 or /bins/1.json
  def show
    pp @bin
    @requests = @bin.requests
  end

  # GET /bins/new
  def new
    @bin = Bin.new
  end

  # GET /bins/1/edit
  def edit; end

  # POST /bins or /bins.json
  def create
    @bin = Bin.new(bin_params)

    respond_to do |format|
      if @bin.save
        format.html do
          redirect_to @bin, notice: 'Bin was successfully created.'
        end
        format.json { render :show, status: :created, location: @bin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bins/1 or /bins/1.json
  def update
    respond_to do |format|
      if @bin.update(bin_params)
        format.html do
          redirect_to @bin, notice: 'Bin was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @bin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bins/1 or /bins/1.json
  def destroy
    @bin.destroy
    respond_to do |format|
      format.html do
        redirect_to bins_url, notice: 'Bin was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_bin
      @bin = Bin.find_by(url: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bin_params
      params.require(:bin).permit(:name, :url)
    end
end
