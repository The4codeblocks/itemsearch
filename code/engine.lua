--Init
if event.type == "program" then
  redraw = function(defaults)
    defaults = {
      "item"=(defaults.item or "default:steel_ingot"),
      "quantity"=(defaults.quantity or 99),
    }
    digiline_send("touch",{
      {
        command="clear",
      },{
        command="addbutton",
        label="Withdraw",
        name="withdrawal",
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
      },{
        label="X",
        command="addbutton",
        type="_exit",
        name="exit",
        W=1, H=1, Y=0, X=0,
      },{X=7.18,label="Created with SX Digi labs Touch Designer",Y=8,command="addlabel"}
    })
  end
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
