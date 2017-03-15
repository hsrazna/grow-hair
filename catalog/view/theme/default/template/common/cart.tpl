<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="az-btn"><img src="image/online-shopping-cart.png" alt="cart"> <span id="cart-total"><?php echo $text_items; ?></span></button>
  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table table-striped az-table-striped">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right">
            <div class="az-plus-minus style2">
              <a href="#" class="az-minus-cart" data-cart-id="<?php echo $product['cart_id']; ?>"></a>
              x <input type="text" name="quantity" value="<?php echo $product['quantity']; ?>" size="2" id="input-quantity" class="form-control" />
              <a href="#" class="az-plus-cart" data-cart-id="<?php echo $product['cart_id']; ?>"></a>
            </div>
          <!-- x <?php echo $product['quantity']; ?> -->
            
          </td>
          <td class="text-right"><?php echo $product['total']; ?></td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs az-btn-remove"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <p class="text-right"><!-- <a href="<?php echo $cart; ?>"><strong><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></strong></a>&nbsp;&nbsp;&nbsp; --><a href="<?php echo $checkout; ?>"><strong><i class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></p>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
<script>
  $(document).ready(function() {
    $("body").on("click", ".az-minus-cart", function(){
      var az_input = parseInt($(this).siblings("input").val());
      if(!az_input){
        az_input = 1;
      }
      az_input = az_input>1?--az_input:az_input;
      $(this).siblings("input").val(az_input);
      cart.update($(this).attr('data-cart-id'), az_input);
      return false;
    });
    $("body").on("click", ".az-plus-cart", function(){
      var az_input = parseInt($(this).siblings("input").val());
      if(!az_input){
        az_input = 1;
      }
      az_input = az_input<99?++az_input:az_input;
      $(this).siblings("input").val(az_input);
      cart.update($(this).attr('data-cart-id'), az_input);
      return false;
    });
  });
</script>