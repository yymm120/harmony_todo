import { CustomColors, CustomTheme } from '@kit.ArkUI'

export class AppColors implements CustomColors {
  //自定义品牌色
  brand = '#FF75D9';
}

export class AppTheme implements CustomTheme {
  public colors: AppColors = new AppColors()
}

export let gAppTheme: CustomTheme = new AppTheme()