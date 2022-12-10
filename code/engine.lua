--Init
  mem.redraw = function(defaults)
    if defaults == nil then
      item = ""
      quantity = 0
    else
      item = defaults.item
      quantity = defaults.quantity
    end
    
    digiline_send("touch",{
      {
        command="clear",
      },{
        command="addbutton",
        label="Recover values",
        name="rv",
        X=7.2, W=1.6, H=0.8, Y=3.2,
      },{
        command="addbutton",
        label="Withdraw",
        name="withdrawal",
        X=7.2, W=1.6, H=0.8, Y=2.5,
      },{
        label="Item",
        command="addfield",
        name="item",
        default=item,
        W=8, H=0.8, X=1.1, Y=1.1,
      },{
        label="Quantity",
        command="addfield",
        name="quantity",
        default=quantity,
        W=1.6, H=0.8, X=7.5, Y=2.1,
      },{X=7.18,label="Created with SX Digi labs Touch Designer",Y=8,command="addlabel"}
    })
  end
  if event.type == "program" then
    mem.redraw({item = "default:steel_ingot", quantity = 0})
  end

  --Debug
  mem.dprint = function(printed)
    digiline_send("scrn",printed)
  end

--Process & Output
if event.type == "digiline" then
  if event.channel == "touch" then
    if event.msg.rv then
      mem.redraw({
        item = mem.item,
        quantity = mem.qtt,
      })
    end
    if event.msg.withdrawal then
      digiline_send("drawer", event.msg.item.." "..event.msg.quantity)
      mem.rem = event.msg.quantity
      mem.qtt = event.msg.quantity
      mem.item = event.msg.item
    end
  end
  if event.channel == "tube" then
    mem.c = event.msg.count
    --Debug
    if false then
    for key, emnt in pairs(event.msg) do
      if type(emnt) == "table" then
        mem.dprint(key..":")
        for keyn, emntn in pairs(emnt) do
          mem.dprint("n "..keyn..", "..emntn)
        end
      else
        mem.dprint(key..", "..emnt)
      end
    end
    end

    --Remaining
    if mem.c ~= 0 and 0 <= tonumber(mem.rem) then
      mem.rem = mem.rem - mem.c
      digiline_send("drawer", mem.item.." "..mem.rem)
      mem.dprint(mem.remaining)
    end

  end
end
