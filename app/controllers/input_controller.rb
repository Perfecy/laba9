class InputController < ApplicationController
  def index
    render layout: false
  end

   def answer
  array = params[:n]
  arr = array.split(' ')
  @inp = array
  arr.map!{|x| x.to_i}
  @posled=func(arr)
  respond_to do |format|
      format.html
      format.json do
        render json: { value:@posled }
      end
    end
 end

 def func(a)
  resarr = []
  s = 0
  sm = []
  d = a[0]
  k = 1
  a.each_index do |i|
    if (i != 0) && (a[i] > d) && (i != (a.length - 1))
      sm.push(a[i])
      s += 1
    elsif (i == 0) && (a[1] > a[0])
      sm.push(a[i])
      s += 1
    elsif (a[i] <= d) && (s > 0)
      resarr.push.push(sm)
      sm = [a[i]]
      s = 0
    elsif (i == (a.length - 1)) && (a[i] > d)
      sm.push(a[i])
      resarr.push.push(sm)
    end
    d = a[i]
  end

  resarr = resarr.sort { |a, b| b.length <=> a.length }

resarr
end
end
