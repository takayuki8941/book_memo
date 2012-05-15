# -*- coding: utf-8 -*-
class BooksController < ApplicationController
  before_filter :find_book, :only => [:show, :destroy, :edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to @book, :notice => "登録しました。"
    else
      render :new
    end
  end

  def show
    #@book = Book.find(params[:id])
  end

  def index
    @books = Book.order('created_at desc')
    respond_to do |format|
      format.html
      format.xml { render :xml => @books }
      format.json { render :json => @books }
    end

  end

  def destroy
    #@book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    #@book = Book.find(params[:id])
  end

  def update
    #@book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to @book, :notice => "更新しました。"
    else
      render :edit
    end
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end
end
