using System.ComponentModel.DataAnnotations;

namespace ToDo.Models
{
    public class Todo
    {
        public int Id { get; set; }

        [Required]
        [StringLength(255)]
        public string Description { get; set; }

        public bool IsComplete { get; set; }
    }
}