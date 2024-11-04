module washingmachine(clk,rst, start, filled, doorclose, doorlock, detergent, cycletime_out, drained, spintime_out, fillvalve_on, soap_wash, motor_on, drainvalve_on, water_wash,done);
input wire clk, rst, doorclose, start, filled, detergent, cycletime_out, drained, spintime_out; 
output reg doorlock, motor_on, fillvalve_on, drainvalve_on, soap_wash,water_wash, done;
parameter check_door=3'b000;
parameter fill_water=3'b001;
parameter add_detergent=3'b010;
parameter cycle=3'b011;
parameter drain_water=3'b100;
parameter spin=3'b101;
  reg[2:0]cs,ns;
  always @ (cs or ns or start or doorclose or filled or detergent or cycletime_out or drained or spintime_out)
    begin
    case(cs)
      check_door: if(start==1 && doorclose==1)
        begin
        ns=fill_water;
          doorlock=1;
          motor_on=0;
          soap_wash=0;
          water_wash=0;
          fillvalve_on=0;
          drainvalve_on=0;
          done=0;
        end
        else begin
          ns=cs;
          doorlock=0;
          motor_on=0;
          soap_wash=0;
          water_wash=0;
          fillvalve_on=0;
          drainvalve_on=0;
          done=0;
        end
      fill_water:if (filled==1)
        begin
          if(soap_wash==0)
            begin
            ns=add_detergent;
              doorlock=1;
              motor_on=0;
              soap_wash=1;
              water_wash=0;
              fillvalve_on=0;
              drainvale_on=0;
              done=0;
            end
            else begin
              ns=cycle;
              doorlock=1;
              motor_on=0;
              soap_wash=1;
              water_wash=1;
              fillvalve_on=0;
              drainvalve_on=0;
              done=0;
            end
        end
      else begin
        ns=cs;
        doorlock=1;
        motor_on=0;
        soap_wash=0;
        water_wash=0;
        fillvalve_on=1;
        drainvalve_on=0;
        done=0;
      end
      add_detergent:
        if(detergent==1)
          begin
            ns=cycle;
            doorlock=1;
            motor_on=0;
            soap_wash=1;
            fillvalve_on=0;
            drainvalve_on=0;
            done=0;
          end
      else begin
        ns=cs;
        doorlock=1;
        motor_on=0;
        soap_wash=1;
        water_wash=0;
        fillvalve_on=0;
        drainvalve_on=0;
        done=0;
      end
      cycle:if(cycletime_out==1)
        begin
          ns=drain_water;
          doorlock=1;
          motor_on=0;
          fillvalve_on=0;
          drainvalve_on=0;
          done=0;
        end
      else begin
        ns=cs;
        doorlock=1;
        motor_on=1;
        fillvalve_on=0;
        drainvalve_on=0;
        done=0;
      end
      drain_water:if(drained==1)
        begin
          if(water_wash==0) begin
            ns=fill_water;
            doorlock=1;
            motor_on=0;
            soap_wash=1;
            fillvalve_on=0;
            drainvalve_on=0;
            done=0;
          end
          else begin
          ns=spin;
            doorlock=1;
            motor_on=0;
            soap_wash=1;
            water_wash=1;
            fillvalve_on=0;
            drainvalve_on=0;
            done=0;
          end
        end
      else begin
        ns=cs;
        doorlock=1;
        motor_on=0;
        soap_wash=1;
        fillvalve_on=0;
        drainvalve_on=1;
        done=0;
      end
      spin:
        if(spintime_out==1)
          begin
            ns=doorclose;
            doorlock=1;
            motor_on=0;
            soap_wash=1;
            water_wash=1;
            fillvalve_on=0;
            drainvalve_on=0;
            done=1;
          end
      else
        begin
          ns=cs;
          doorlock=1;
          motor_on=0;
          soap_wash=1;
          water_wash=1;
          fillvalve_on=0;
          drainvalve_on=1;
          done=0;
        end
      default:
        ns=check_door;
    endcase
    end
  always @(posedge clk or negedge rst)
    begin
      if(rst)
        begin
          cs<=3'b000;
        end
      else begin
        cs<=ns;
      end
    end
endmodule
