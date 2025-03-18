module bluetooth_test( 
              rxd,txd, 
              bt_rxd_emod0, bt_txd_emod0, bt_at_emod0,bt_sleep_emod0 
 				  );


input rxd; 
output txd; 

input bt_txd_emod0;
output bt_rxd_emod0, bt_at_emod0,bt_sleep_emod0; 


assign txd = bt_txd_emod0;
assign bt_rxd_emod0 = rxd;
assign bt_at_emod0 = 1'b1;
assign bt_sleep_emod0 = 1'b1;


endmodule 