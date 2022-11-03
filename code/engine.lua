--Init
if event.type == "program" then
  digiline_send("touch",{
    {
      command="clear",
    },{
      command="addbutton",
      label="Withdraw",
      name="button1",
      X=7.2, W=1.6, H=0.8, Y=2.5,
    },{
      label="Item",
      command="addfield",
      name="item",
      default="default:steel_ingot",
      W=8, H=0.8, X=1.1, Y=1.1,
    },{
      label="Quantity",
      command="addfield",
      name="quantity",
      W=1.6, H=0.8, X=7.5, Y=2.1,
    },{X=7.18,label="Created with SX Digi labs Touch Designer",Y=8,command="addlabel"}
  })
end
--Input

--Process

--Output
if event.type == "digiline" then
  if event.channel == "touch" then
    digiline_send("drawer", event.msg.item.." "..event.msg.quantity)
    digiline_send("scrn", event.msg)
  end
end
