{ ... }:
{
  time.timeZone = "Europe/Rotterdam";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "nl_NL.UTF-8"; # Dutch address formatting
      LC_IDENTIFICATION = "nl_NL.UTF-8"; # Dutch locale metadata
      LC_MEASUREMENT = "nl_NL.UTF-8"; # Metric system with Dutch conventions
      LC_MONETARY = "nl_NL.UTF-8"; # Euro formatting (€ 1.234,56)
      LC_NAME = "nl_NL.UTF-8"; # Dutch name formatting
      LC_NUMERIC = "nl_NL.UTF-8"; # Number format: 1.234,56
      LC_PAPER = "nl_NL.UTF-8"; # A4 paper standard
      LC_TELEPHONE = "nl_NL.UTF-8"; # Dutch phone numbers
      LC_TIME = "nl_NL.UTF-8"; # Date format: dd-mm-yyyy
    };
  };
}
