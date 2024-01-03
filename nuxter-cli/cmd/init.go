package cmd

import (
	"log"

	"github.com/go-git/go-git/v5"
	"github.com/spf13/cobra"
)

// timezoneCmd represents the timezone command
var initCmd = &cobra.Command{
	Use:   "init [new-project-directory]",
	Short: "Initialize a new Nuxter project",
	Long:  `Initialize a new Nuxter project by cloning the Nuxter repository from GitHub.`,
	Run: func(cmd *cobra.Command, args []string) {
		if len(args) == 0 || args[0] == "" {
			log.Fatalln("Please specify a directory for your new project.")
		}
		directory := args[0]

		url := "https://github.com/chris-paganon/nuxter"
		_, err := git.PlainClone(directory, false, &git.CloneOptions{
			URL:               url,
			RecurseSubmodules: git.DefaultSubmoduleRecursionDepth,
		})

		if err != nil {
			log.Fatalln(err)
		}
	},
}

func init() {
	rootCmd.AddCommand(initCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// timezoneCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// timezoneCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
